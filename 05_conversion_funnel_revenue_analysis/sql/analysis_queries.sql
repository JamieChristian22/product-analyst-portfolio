-- Conversion Funnel & Revenue Performance — Corporate SQL Pack (PostgreSQL)

-- 1. Data quality and event grain
SELECT COUNT(*) rows, COUNT(DISTINCT user_id) users,
       SUM(CASE WHEN revenue < 0 THEN 1 ELSE 0 END) negative_revenue
FROM conversion_funnel_events;

-- 2. Funnel stage users
SELECT event, COUNT(DISTINCT user_id) users
FROM conversion_funnel_events
GROUP BY event
ORDER BY CASE event WHEN 'view' THEN 1 WHEN 'add_to_cart' THEN 2 WHEN 'checkout' THEN 3 WHEN 'purchase' THEN 4 END;

-- 3. Ordered user funnel flags
WITH u AS (
 SELECT user_id,
  MAX(CASE WHEN event='view' THEN 1 ELSE 0 END) viewed,
  MAX(CASE WHEN event='add_to_cart' THEN 1 ELSE 0 END) carted,
  MAX(CASE WHEN event='checkout' THEN 1 ELSE 0 END) checked_out,
  MAX(CASE WHEN event='purchase' THEN 1 ELSE 0 END) purchased
 FROM conversion_funnel_events GROUP BY 1
)
SELECT COUNT(*) users, SUM(carted) carted, SUM(checked_out) checked_out, SUM(purchased) purchased FROM u;

-- 4. Revenue by device
SELECT device, COUNT(DISTINCT CASE WHEN event='purchase' THEN user_id END) purchasers,
       ROUND(SUM(CASE WHEN event='purchase' THEN revenue ELSE 0 END)::numeric,2) revenue
FROM conversion_funnel_events GROUP BY 1 ORDER BY revenue DESC;

-- 5. Channel conversion and revenue
WITH user_channel AS (
 SELECT user_id, MAX(medium) medium,
        MAX(CASE WHEN event='view' THEN 1 ELSE 0 END) viewed,
        MAX(CASE WHEN event='purchase' THEN 1 ELSE 0 END) purchased,
        SUM(CASE WHEN event='purchase' THEN revenue ELSE 0 END) revenue
 FROM conversion_funnel_events GROUP BY 1
)
SELECT medium, SUM(viewed) viewers, SUM(purchased) purchasers,
       ROUND(SUM(purchased)::numeric/NULLIF(SUM(viewed),0)*100,2) conversion_pct,
       ROUND(SUM(revenue)::numeric,2) revenue
FROM user_channel GROUP BY 1 ORDER BY revenue DESC;

-- 6. Geographic revenue
SELECT country, COUNT(DISTINCT CASE WHEN event='purchase' THEN user_id END) purchasers,
       ROUND(SUM(CASE WHEN event='purchase' THEN revenue ELSE 0 END)::numeric,2) revenue
FROM conversion_funnel_events GROUP BY 1 ORDER BY revenue DESC;

-- 7. Time to purchase using chronological timestamps
WITH journey AS (
 SELECT user_id,
   MIN(CASE WHEN event='view' THEN event_date::timestamp END) first_view,
   MIN(CASE WHEN event='purchase' THEN event_date::timestamp END) first_purchase
 FROM conversion_funnel_events GROUP BY 1
)
SELECT ROUND(AVG(EXTRACT(EPOCH FROM(first_purchase-first_view))/60)::numeric,2) avg_minutes_to_purchase
FROM journey WHERE first_purchase >= first_view;

-- 8. Weekly revenue and time-to-purchase
WITH p AS (
 SELECT user_id, MIN(event_date::timestamp) FILTER (WHERE event='view') first_view,
        MIN(event_date::timestamp) FILTER (WHERE event='purchase') purchase_time,
        SUM(revenue) FILTER (WHERE event='purchase') revenue
 FROM conversion_funnel_events GROUP BY 1
)
SELECT DATE_TRUNC('week',purchase_time)::date week_start, COUNT(*) purchases,
       ROUND(SUM(revenue)::numeric,2) revenue,
       ROUND(AVG(EXTRACT(EPOCH FROM(purchase_time-first_view))/60)::numeric,2) avg_minutes_to_purchase
FROM p WHERE purchase_time IS NOT NULL AND purchase_time>=first_view
GROUP BY 1 ORDER BY 1;

-- 9. Device x channel friction matrix
WITH u AS (
 SELECT user_id, MAX(device) device, MAX(medium) medium,
        MAX(CASE WHEN event='view' THEN 1 ELSE 0 END) viewed,
        MAX(CASE WHEN event='purchase' THEN 1 ELSE 0 END) purchased,
        SUM(CASE WHEN event='purchase' THEN revenue ELSE 0 END) revenue
 FROM conversion_funnel_events GROUP BY 1
)
SELECT device, medium, SUM(viewed) viewers, SUM(purchased) purchasers,
       ROUND(SUM(purchased)::numeric/NULLIF(SUM(viewed),0)*100,2) conversion_pct,
       ROUND(SUM(revenue)::numeric,2) revenue
FROM u GROUP BY 1,2 HAVING SUM(viewed)>=30
ORDER BY conversion_pct ASC, viewers DESC;

-- 10. Impossible-sequence audit
WITH s AS (
 SELECT user_id,
  MIN(event_date::timestamp) FILTER (WHERE event='view') v,
  MIN(event_date::timestamp) FILTER (WHERE event='add_to_cart') c,
  MIN(event_date::timestamp) FILTER (WHERE event='checkout') co,
  MIN(event_date::timestamp) FILTER (WHERE event='purchase') p
 FROM conversion_funnel_events GROUP BY 1
)
SELECT COUNT(*) impossible_users FROM s
WHERE (c IS NOT NULL AND c<v) OR (co IS NOT NULL AND (c IS NULL OR co<c)) OR (p IS NOT NULL AND (co IS NULL OR p<co));
