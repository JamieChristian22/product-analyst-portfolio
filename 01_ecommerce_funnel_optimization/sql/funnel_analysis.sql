-- ============================================================================
-- E-COMMERCE FUNNEL OPTIMIZATION
-- Corporate Product Analytics SQL Pack (PostgreSQL)
-- Author: Jamie Christian II
-- Purpose: session-level funnel analysis, segmentation, revenue and prioritization
-- ============================================================================

-- Expected table: ecommerce_events
-- Columns:
-- event_date, year_month, country, category, device_type, user_id, session_id,
-- event_name, quantity, unit_price, revenue

-- 0. DATA QUALITY CHECKS
SELECT
    COUNT(*) AS event_rows,
    COUNT(DISTINCT session_id) AS distinct_sessions,
    COUNT(DISTINCT user_id) AS distinct_users,
    SUM(CASE WHEN session_id IS NULL THEN 1 ELSE 0 END) AS null_session_ids,
    SUM(CASE WHEN event_name NOT IN ('viewed','add_to_cart','checkout_started','purchased') THEN 1 ELSE 0 END) AS invalid_event_names
FROM ecommerce_events;

-- Duplicate event audit
SELECT session_id, event_name, COUNT(*) AS duplicate_count
FROM ecommerce_events
GROUP BY 1,2
HAVING COUNT(*) > 1
ORDER BY duplicate_count DESC;

-- 1. SESSION-LEVEL FUNNEL MODEL
DROP VIEW IF EXISTS ecommerce_session_funnel;
CREATE VIEW ecommerce_session_funnel AS
SELECT
    session_id,
    MAX(user_id) AS user_id,
    MIN(event_date::date) AS session_date,
    MAX(year_month) AS year_month,
    MAX(country) AS country,
    MAX(category) AS category,
    MAX(device_type) AS device_type,
    MAX(CASE WHEN event_name='viewed' THEN 1 ELSE 0 END) AS viewed,
    MAX(CASE WHEN event_name='add_to_cart' THEN 1 ELSE 0 END) AS add_to_cart,
    MAX(CASE WHEN event_name='checkout_started' THEN 1 ELSE 0 END) AS checkout_started,
    MAX(CASE WHEN event_name='purchased' THEN 1 ELSE 0 END) AS purchased,
    SUM(CASE WHEN event_name='purchased' THEN COALESCE(revenue,0) ELSE 0 END) AS revenue
FROM ecommerce_events
GROUP BY session_id;

-- 2. OVERALL FUNNEL + STAGE CONVERSION
WITH f AS (
    SELECT
        COUNT(*) FILTER (WHERE viewed=1) AS viewed,
        COUNT(*) FILTER (WHERE add_to_cart=1) AS cart,
        COUNT(*) FILTER (WHERE checkout_started=1) AS checkout,
        COUNT(*) FILTER (WHERE purchased=1) AS purchased
    FROM ecommerce_session_funnel
)
SELECT
    viewed,
    cart,
    checkout,
    purchased,
    ROUND(cart::numeric / NULLIF(viewed,0) * 100, 2) AS view_to_cart_pct,
    ROUND(checkout::numeric / NULLIF(cart,0) * 100, 2) AS cart_to_checkout_pct,
    ROUND(purchased::numeric / NULLIF(checkout,0) * 100, 2) AS checkout_to_purchase_pct,
    ROUND(purchased::numeric / NULLIF(viewed,0) * 100, 2) AS overall_conversion_pct,
    viewed-cart AS view_to_cart_dropoff,
    cart-checkout AS cart_to_checkout_dropoff,
    checkout-purchased AS checkout_to_purchase_dropoff
FROM f;

-- 3. MONTHLY PERFORMANCE TREND
SELECT
    year_month,
    COUNT(*) AS sessions,
    SUM(purchased) AS purchases,
    ROUND(AVG(purchased)::numeric * 100, 2) AS purchase_conversion_pct,
    ROUND(SUM(revenue)::numeric, 2) AS revenue,
    ROUND(AVG(CASE WHEN purchased=1 THEN revenue END)::numeric, 2) AS aov
FROM ecommerce_session_funnel
GROUP BY year_month
ORDER BY year_month;

-- 4. DEVICE SEGMENT ANALYSIS
SELECT
    device_type,
    COUNT(*) AS sessions,
    SUM(add_to_cart) AS cart_sessions,
    SUM(checkout_started) AS checkout_sessions,
    SUM(purchased) AS purchase_sessions,
    ROUND(AVG(add_to_cart)::numeric*100,2) AS view_to_cart_pct,
    ROUND(SUM(checkout_started)::numeric / NULLIF(SUM(add_to_cart),0)*100,2) AS cart_to_checkout_pct,
    ROUND(SUM(purchased)::numeric / NULLIF(SUM(checkout_started),0)*100,2) AS checkout_to_purchase_pct,
    ROUND(AVG(purchased)::numeric*100,2) AS overall_conversion_pct,
    ROUND(SUM(revenue)::numeric,2) AS revenue,
    ROUND((SUM(revenue)/COUNT(*))::numeric,2) AS revenue_per_session
FROM ecommerce_session_funnel
GROUP BY device_type
ORDER BY overall_conversion_pct DESC;

-- 5. CATEGORY SEGMENT ANALYSIS
SELECT
    category,
    COUNT(*) AS sessions,
    ROUND(AVG(add_to_cart)::numeric*100,2) AS view_to_cart_pct,
    ROUND(AVG(purchased)::numeric*100,2) AS overall_conversion_pct,
    ROUND(SUM(revenue)::numeric,2) AS revenue,
    ROUND(AVG(CASE WHEN purchased=1 THEN revenue END)::numeric,2) AS aov
FROM ecommerce_session_funnel
GROUP BY category
ORDER BY overall_conversion_pct DESC;

-- 6. COUNTRY SEGMENT ANALYSIS
SELECT
    country,
    COUNT(*) AS sessions,
    ROUND(AVG(purchased)::numeric*100,2) AS overall_conversion_pct,
    ROUND(SUM(revenue)::numeric,2) AS revenue,
    ROUND((SUM(revenue)/COUNT(*))::numeric,2) AS revenue_per_session
FROM ecommerce_session_funnel
GROUP BY country
ORDER BY overall_conversion_pct DESC;

-- 7. LARGEST FUNNEL BOTTLENECK
WITH c AS (
    SELECT
        COUNT(*) AS viewed,
        SUM(add_to_cart) AS cart,
        SUM(checkout_started) AS checkout,
        SUM(purchased) AS purchased
    FROM ecommerce_session_funnel
), transitions AS (
    SELECT 'View → Add to Cart' AS transition, viewed AS starting_sessions, cart AS completed_sessions FROM c
    UNION ALL
    SELECT 'Cart → Checkout', cart, checkout FROM c
    UNION ALL
    SELECT 'Checkout → Purchase', checkout, purchased FROM c
)
SELECT
    transition,
    starting_sessions,
    completed_sessions,
    starting_sessions-completed_sessions AS dropoff_sessions,
    ROUND((1-completed_sessions::numeric/NULLIF(starting_sessions,0))*100,2) AS dropoff_pct
FROM transitions
ORDER BY dropoff_sessions DESC;

-- 8. OPPORTUNITY SIZING
-- Example: estimate purchases recovered by reducing each stage's observed drop-off by 10%.
WITH k AS (
    SELECT
        COUNT(*) AS viewed,
        SUM(add_to_cart) AS cart,
        SUM(checkout_started) AS checkout,
        SUM(purchased) AS purchased,
        AVG(CASE WHEN purchased=1 THEN revenue END) AS aov
    FROM ecommerce_session_funnel
)
SELECT
    ROUND((viewed-cart)*0.10 * (checkout::numeric/NULLIF(cart,0)) * (purchased::numeric/NULLIF(checkout,0)), 1)
        AS incremental_purchases_from_10pct_view_cart_recovery,
    ROUND(((viewed-cart)*0.10 * (checkout::numeric/NULLIF(cart,0)) * (purchased::numeric/NULLIF(checkout,0)) * aov)::numeric, 2)
        AS estimated_incremental_revenue
FROM k;

-- 9. HIGH-VOLUME / LOW-CONVERSION PRIORITIZATION MATRIX
WITH segment AS (
    SELECT
        device_type,
        category,
        COUNT(*) AS sessions,
        AVG(purchased)::numeric AS conversion_rate,
        SUM(revenue) AS revenue
    FROM ecommerce_session_funnel
    GROUP BY 1,2
), benchmark AS (
    SELECT AVG(purchased)::numeric AS overall_conversion
    FROM ecommerce_session_funnel
)
SELECT
    s.device_type,
    s.category,
    s.sessions,
    ROUND(s.conversion_rate*100,2) AS conversion_pct,
    ROUND(b.overall_conversion*100,2) AS overall_benchmark_pct,
    ROUND((s.conversion_rate-b.overall_conversion)*100,2) AS gap_vs_benchmark_pp,
    ROUND(s.revenue::numeric,2) AS revenue
FROM segment s
CROSS JOIN benchmark b
WHERE s.sessions >= 100
  AND s.conversion_rate < b.overall_conversion
ORDER BY s.sessions DESC, gap_vs_benchmark_pp ASC;

-- 10. ANALYST QA: impossible funnel sequences
SELECT
    SUM(CASE WHEN checkout_started=1 AND add_to_cart=0 THEN 1 ELSE 0 END) AS checkout_without_cart,
    SUM(CASE WHEN purchased=1 AND checkout_started=0 THEN 1 ELSE 0 END) AS purchase_without_checkout
FROM ecommerce_session_funnel;
