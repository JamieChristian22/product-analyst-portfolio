-- Conversion, Retention & Revenue — Corporate KPI SQL Pack (PostgreSQL)
-- User grain: one row per acquired user.

-- 1) DATA QUALITY
SELECT COUNT(*) rows, COUNT(DISTINCT user_id) users,
 SUM(CASE WHEN is_paid=1 AND paid_conversion_date IS NULL THEN 1 ELSE 0 END) paid_missing_date,
 SUM(CASE WHEN retained_30d=1 AND is_paid=0 THEN 1 ELSE 0 END) impossible_retention
FROM kpi_users;

-- 2) EXECUTIVE KPI SCORECARD
SELECT COUNT(*) users,
 SUM(is_paid) paid_users,
 ROUND(AVG(is_paid::numeric)*100,2) conversion_rate_pct,
 ROUND(AVG(CASE WHEN is_paid=1 THEN retained_30d END::numeric)*100,2) retention_30d_pct,
 ROUND(SUM(revenue_usd)::numeric,2) revenue,
 ROUND(SUM(revenue_usd)::numeric/NULLIF(SUM(is_paid),0),2) arppu
FROM kpi_users;

-- 3) CHANNEL PERFORMANCE
WITH spend AS (
 SELECT acquisition_channel, SUM(spend_usd) spend FROM marketing_spend_daily GROUP BY 1
), k AS (
 SELECT acquisition_channel, COUNT(*) users, SUM(is_paid) paid_users,
 AVG(is_paid::numeric) conversion_rate,
 AVG(CASE WHEN is_paid=1 THEN retained_30d END::numeric) retention_30d,
 SUM(revenue_usd) revenue
 FROM kpi_users GROUP BY 1
)
SELECT k.*, s.spend,
 ROUND(s.spend/NULLIF(k.paid_users,0),2) cac,
 ROUND((k.revenue-s.spend)/NULLIF(s.spend,0),4) roi,
 ROUND(k.revenue/NULLIF(k.paid_users,0),2) arppu
FROM k JOIN spend s USING(acquisition_channel)
ORDER BY roi DESC;

-- 4) PLAN ECONOMICS
SELECT plan_type, COUNT(*) users, SUM(is_paid) paid_users,
 ROUND(AVG(CASE WHEN is_paid=1 THEN retained_30d END::numeric)*100,2) retention_30d_pct,
 ROUND(SUM(revenue_usd)::numeric,2) revenue,
 ROUND(SUM(revenue_usd)::numeric/NULLIF(SUM(is_paid),0),2) arppu
FROM kpi_users GROUP BY 1 ORDER BY revenue DESC;

-- 5) MONTHLY ACQUISITION COHORTS
SELECT DATE_TRUNC('month',signup_date)::date cohort_month, COUNT(*) users,
 SUM(is_paid) paid_users, ROUND(AVG(is_paid::numeric)*100,2) conversion_pct,
 ROUND(AVG(CASE WHEN is_paid=1 THEN retained_30d END::numeric)*100,2) retention_30d_pct,
 ROUND(SUM(revenue_usd)::numeric,2) revenue
FROM kpi_users GROUP BY 1 ORDER BY 1;

-- 6) TIME TO PAID
SELECT acquisition_channel,
 ROUND(AVG(days_to_paid)::numeric,2) avg_days_to_paid,
 ROUND(PERCENTILE_CONT(.5) WITHIN GROUP (ORDER BY days_to_paid)::numeric,2) median_days_to_paid
FROM kpi_users WHERE is_paid=1 GROUP BY 1 ORDER BY avg_days_to_paid;

-- 7) REVENUE CONCENTRATION
SELECT acquisition_channel, plan_type, COUNT(*) users,
 ROUND(SUM(revenue_usd)::numeric,2) revenue,
 ROUND(AVG(CASE WHEN is_paid=1 THEN retained_30d END::numeric)*100,2) retention_pct
FROM kpi_users GROUP BY 1,2 ORDER BY revenue DESC;

-- 8) CAC TREND
SELECT DATE_TRUNC('month',spend_date)::date month, acquisition_channel,
 ROUND(SUM(spend_usd)::numeric,2) spend
FROM marketing_spend_daily GROUP BY 1,2 ORDER BY 1,2;

-- 9) BREAK-EVEN / UNIT ECONOMICS INPUTS
-- Production analysis should join billing, gross margin, churn, and fully loaded acquisition cost.
WITH channel AS (
 SELECT acquisition_channel, SUM(is_paid) paid_users, SUM(revenue_usd) revenue
 FROM kpi_users GROUP BY 1
), spend AS (
 SELECT acquisition_channel, SUM(spend_usd) spend FROM marketing_spend_daily GROUP BY 1
)
SELECT c.acquisition_channel,
 ROUND(c.revenue/NULLIF(c.paid_users,0),2) observed_arppu,
 ROUND(s.spend/NULLIF(c.paid_users,0),2) cac,
 ROUND((s.spend/NULLIF(c.paid_users,0))/0.78,2) break_even_monthly_arppu_at_78pct_gm
FROM channel c JOIN spend s USING(acquisition_channel)
ORDER BY cac;
