-- Funnel conversion by stage
SELECT event, COUNT(DISTINCT user_id) AS users
FROM conversion_funnel_events
GROUP BY event
ORDER BY users DESC;

-- Revenue by device
SELECT device, SUM(revenue) AS total_revenue
FROM conversion_funnel_events
WHERE event = 'purchase'
GROUP BY device;

-- Average time to purchase
SELECT user_id,
       DATEDIFF(day, MIN(event_date), MAX(event_date)) AS days_to_purchase
FROM conversion_funnel_events
GROUP BY user_id;