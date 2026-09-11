-- StreamFlow SaaS Product Analytics — Corporate SQL Pack (PostgreSQL)
-- Dataset grain: one row per product event.

-- 1) DATA QUALITY
SELECT COUNT(*) event_rows, COUNT(DISTINCT user_id) users,
       MIN(event_date) min_date, MAX(event_date) max_date,
       SUM(CASE WHEN user_id IS NULL THEN 1 ELSE 0 END) null_users
FROM streamflow_events;

-- 2) DAILY ACTIVE USERS
SELECT event_date::date AS activity_date,
       COUNT(DISTINCT user_id) AS dau,
       COUNT(*) AS events,
       ROUND(SUM(revenue_usd)::numeric,2) AS revenue
FROM streamflow_events
GROUP BY 1 ORDER BY 1;

-- 3) MONTHLY ACTIVE USERS + DAU/MAU INPUTS
SELECT DATE_TRUNC('month',event_date)::date AS month,
       COUNT(DISTINCT user_id) AS mau,
       COUNT(*) AS events,
       ROUND(SUM(revenue_usd)::numeric,2) AS revenue
FROM streamflow_events
GROUP BY 1 ORDER BY 1;

-- 4) FEATURE ADOPTION
WITH total AS (SELECT COUNT(DISTINCT user_id)::numeric users FROM streamflow_events)
SELECT event_name,
       COUNT(DISTINCT user_id) AS feature_users,
       COUNT(*) AS events,
       ROUND(COUNT(DISTINCT user_id)::numeric/(SELECT users FROM total)*100,2) AS adoption_pct
FROM streamflow_events
GROUP BY 1 ORDER BY adoption_pct DESC;

-- 5) ACTIVATION: CREATE PROJECT + UPLOAD VIDEO
WITH u AS (
 SELECT user_id,
   MAX(CASE WHEN event_name='create_project' THEN 1 ELSE 0 END) created_project,
   MAX(CASE WHEN event_name='upload_video' THEN 1 ELSE 0 END) uploaded_video
 FROM streamflow_events GROUP BY user_id
)
SELECT COUNT(*) users,
       SUM(CASE WHEN created_project=1 AND uploaded_video=1 THEN 1 ELSE 0 END) activated_users,
       ROUND(AVG(CASE WHEN created_project=1 AND uploaded_video=1 THEN 1.0 ELSE 0 END)*100,2) activation_pct
FROM u;

-- 6) PLAN PERFORMANCE
SELECT plan_type, COUNT(DISTINCT user_id) users, COUNT(*) events,
       ROUND(SUM(revenue_usd)::numeric,2) revenue,
       ROUND(SUM(revenue_usd)::numeric/NULLIF(COUNT(DISTINCT user_id),0),2) revenue_per_user
FROM streamflow_events
GROUP BY 1 ORDER BY revenue DESC;

-- 7) ACQUISITION CHANNEL QUALITY
SELECT acquisition_channel, COUNT(DISTINCT user_id) users,
       COUNT(*) events, ROUND(SUM(revenue_usd)::numeric,2) revenue,
       ROUND(SUM(revenue_usd)::numeric/NULLIF(COUNT(DISTINCT user_id),0),2) revenue_per_user
FROM streamflow_events
GROUP BY 1 ORDER BY revenue_per_user DESC;

-- 8) CANCELLATION SIGNAL
SELECT plan_type,
       COUNT(DISTINCT CASE WHEN event_name='subscribe' THEN user_id END) subscribed_users,
       COUNT(DISTINCT CASE WHEN event_name='cancel_subscription' THEN user_id END) cancelled_users
FROM streamflow_events GROUP BY 1;

-- 9) POWER USERS
WITH u AS (
 SELECT user_id, COUNT(*) events, COUNT(DISTINCT event_name) features_used
 FROM streamflow_events GROUP BY 1
)
SELECT COUNT(*) users,
       SUM(CASE WHEN events>=8 AND features_used>=3 THEN 1 ELSE 0 END) power_users,
       ROUND(AVG(CASE WHEN events>=8 AND features_used>=3 THEN 1.0 ELSE 0 END)*100,2) power_user_pct
FROM u;

-- 10) COHORT FOUNDATION
SELECT user_id, DATE_TRUNC('month',MIN(event_date))::date AS acquisition_cohort
FROM streamflow_events GROUP BY user_id;
