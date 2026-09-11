-- User Journey to First Purchase — Corporate Product Analytics SQL Pack (PostgreSQL)
-- Grain: one row per user first-purchase journey.

-- 1. DATA QUALITY
SELECT COUNT(*) journeys, COUNT(DISTINCT user_id) users,
       SUM(CASE WHEN first_purchase_date < first_touch_date THEN 1 ELSE 0 END) invalid_date_sequences,
       SUM(CASE WHEN sessions_before_purchase < 1 THEN 1 ELSE 0 END) invalid_session_counts
FROM first_purchase_journey;

-- 2. EXECUTIVE JOURNEY KPIs
SELECT COUNT(*) users,
       ROUND(AVG(sessions_before_purchase)::numeric,2) avg_sessions_before_purchase,
       ROUND(AVG(events_before_purchase)::numeric,2) avg_events_before_purchase,
       ROUND(PERCENTILE_CONT(.5) WITHIN GROUP (ORDER BY journey_duration_days)::numeric,2) median_journey_days,
       ROUND(AVG(first_purchase_revenue)::numeric,2) avg_first_purchase_revenue,
       ROUND(AVG(CASE WHEN journey_duration_days<=7 THEN 1.0 ELSE 0 END)*100,2) fast_purchase_7d_pct
FROM first_purchase_journey;

-- 3. ACQUISITION JOURNEY QUALITY
SELECT first_medium, COUNT(*) users,
       ROUND(AVG(sessions_before_purchase)::numeric,2) avg_sessions,
       ROUND(PERCENTILE_CONT(.5) WITHIN GROUP (ORDER BY journey_duration_days)::numeric,2) median_days,
       ROUND(AVG(CASE WHEN journey_duration_days<=7 THEN 1.0 ELSE 0 END)*100,2) fast_purchase_7d_pct,
       ROUND(AVG(first_purchase_revenue)::numeric,2) avg_first_purchase_revenue
FROM first_purchase_journey
GROUP BY 1 ORDER BY fast_purchase_7d_pct DESC;

-- 4. DEVICE JOURNEY QUALITY
SELECT device_type, COUNT(*) users,
       ROUND(AVG(sessions_before_purchase)::numeric,2) avg_sessions,
       ROUND(AVG(events_before_purchase)::numeric,2) avg_events,
       ROUND(PERCENTILE_CONT(.5) WITHIN GROUP (ORDER BY journey_duration_days)::numeric,2) median_days,
       ROUND(AVG(first_purchase_revenue)::numeric,2) avg_revenue
FROM first_purchase_journey
GROUP BY 1 ORDER BY median_days;

-- 5. JOURNEY SEGMENTS
SELECT journey_segment, COUNT(*) users,
       ROUND(AVG(sessions_before_purchase)::numeric,2) avg_sessions,
       ROUND(PERCENTILE_CONT(.5) WITHIN GROUP (ORDER BY journey_duration_days)::numeric,2) median_days,
       ROUND(AVG(CASE WHEN journey_duration_days<=7 THEN 1.0 ELSE 0 END)*100,2) fast_purchase_7d_pct,
       ROUND(AVG(first_purchase_revenue)::numeric,2) avg_revenue
FROM first_purchase_journey
GROUP BY 1 ORDER BY fast_purchase_7d_pct DESC;

-- 6. FRICTION BANDS
SELECT CASE WHEN sessions_before_purchase=1 THEN '1 session'
            WHEN sessions_before_purchase=2 THEN '2 sessions'
            WHEN sessions_before_purchase BETWEEN 3 AND 4 THEN '3–4 sessions'
            ELSE '5+ sessions' END AS session_band,
       COUNT(*) users,
       ROUND(PERCENTILE_CONT(.5) WITHIN GROUP (ORDER BY journey_duration_days)::numeric,2) median_days,
       ROUND(AVG(first_purchase_revenue)::numeric,2) avg_revenue
FROM first_purchase_journey
GROUP BY 1 ORDER BY MIN(sessions_before_purchase);

-- 7. HIGH-FRICTION USER SEGMENTS
SELECT first_medium, device_type, journey_segment,
       COUNT(*) users,
       ROUND(AVG(sessions_before_purchase)::numeric,2) avg_sessions,
       ROUND(PERCENTILE_CONT(.5) WITHIN GROUP (ORDER BY journey_duration_days)::numeric,2) median_days
FROM first_purchase_journey
GROUP BY 1,2,3
HAVING COUNT(*) >= 30
ORDER BY median_days DESC, users DESC;

-- 8. REVENUE QUALITY
SELECT first_medium,
       ROUND(AVG(first_purchase_revenue)::numeric,2) avg_first_purchase_revenue,
       ROUND(AVG(revenue_per_session)::numeric,2) avg_revenue_per_session
FROM first_purchase_journey
GROUP BY 1 ORDER BY avg_revenue_per_session DESC;


-- 9. MONTHLY FIRST-TOUCH COHORTS
SELECT DATE_TRUNC('month',first_touch_date)::date AS cohort_month,
       COUNT(*) users,
       ROUND(AVG(sessions_before_purchase)::numeric,2) avg_sessions,
       ROUND(PERCENTILE_CONT(.5) WITHIN GROUP (ORDER BY journey_duration_days)::numeric,2) median_journey_days,
       ROUND(AVG(CASE WHEN journey_duration_days<=7 THEN 1.0 ELSE 0 END)*100,2) fast_purchase_7d_pct,
       ROUND(AVG(first_purchase_revenue)::numeric,2) avg_first_purchase_revenue
FROM first_purchase_journey
GROUP BY 1 ORDER BY 1;

-- 10. MEDIUM x DEVICE PRIORITY MATRIX
SELECT first_medium, device_type,
       COUNT(*) users,
       ROUND(AVG(sessions_before_purchase)::numeric,2) avg_sessions,
       ROUND(PERCENTILE_CONT(.5) WITHIN GROUP (ORDER BY journey_duration_days)::numeric,2) median_days,
       ROUND(AVG(CASE WHEN journey_duration_days<=7 THEN 1.0 ELSE 0 END)*100,2) fast_purchase_7d_pct
FROM first_purchase_journey
GROUP BY 1,2
HAVING COUNT(*) >= 30
ORDER BY median_days DESC, fast_purchase_7d_pct ASC;

-- 11. DATA INTEGRITY / OUTLIER AUDIT
SELECT
    SUM(CASE WHEN journey_duration_days < 0 THEN 1 ELSE 0 END) negative_duration,
    SUM(CASE WHEN first_purchase_revenue < 0 THEN 1 ELSE 0 END) negative_revenue,
    SUM(CASE WHEN events_before_purchase < sessions_before_purchase THEN 1 ELSE 0 END) suspicious_event_session_ratio
FROM first_purchase_journey;
