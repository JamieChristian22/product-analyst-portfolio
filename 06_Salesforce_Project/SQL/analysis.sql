-- Salesforce Sales Pipeline Analytics — Corporate SQL Pack (PostgreSQL)

-- 1. Executive pipeline scorecard
SELECT
 SUM(CASE WHEN Stage NOT IN ('Closed Won','Closed Lost') THEN Amount ELSE 0 END) AS open_pipeline,
 SUM(CASE WHEN Stage NOT IN ('Closed Won','Closed Lost') THEN Amount*Probability ELSE 0 END) AS weighted_pipeline,
 SUM(CASE WHEN Stage='Closed Won' THEN Amount ELSE 0 END) AS won_revenue,
 SUM(CASE WHEN Stage='Closed Lost' THEN Amount ELSE 0 END) AS lost_value,
 AVG(Amount) AS avg_deal_size
FROM salesforce_opportunities;

-- 2. Stage analysis
SELECT Stage, COUNT(*) deals, SUM(Amount) amount, AVG(Probability) avg_probability,
 SUM(Amount*Probability) weighted_pipeline, AVG(Age_Days) avg_age_days,
 SUM(Stale_Flag) stale_deals, SUM(Overdue_Flag) overdue_deals
FROM salesforce_opportunities GROUP BY Stage ORDER BY avg_probability;

-- 3. Win rate
SELECT
 SUM(CASE WHEN Stage='Closed Won' THEN 1 ELSE 0 END)::numeric /
 NULLIF(SUM(CASE WHEN Stage IN ('Closed Won','Closed Lost') THEN 1 ELSE 0 END),0) AS win_rate
FROM salesforce_opportunities;

-- 4. Rep performance
SELECT Owner, COUNT(*) opportunities,
 SUM(CASE WHEN Stage='Closed Won' THEN Amount ELSE 0 END) won_revenue,
 SUM(CASE WHEN Stage NOT IN ('Closed Won','Closed Lost') THEN Amount ELSE 0 END) open_pipeline,
 SUM(CASE WHEN Stage NOT IN ('Closed Won','Closed Lost') THEN Amount*Probability ELSE 0 END) weighted_pipeline,
 SUM(CASE WHEN Stage NOT IN ('Closed Won','Closed Lost') THEN Stale_Flag ELSE 0 END) stale_open
FROM salesforce_opportunities GROUP BY Owner ORDER BY won_revenue DESC;

-- 5. Industry performance
SELECT Industry, COUNT(*) opportunities,
 SUM(CASE WHEN Stage='Closed Won' THEN Amount ELSE 0 END) won_revenue,
 SUM(CASE WHEN Stage NOT IN ('Closed Won','Closed Lost') THEN Amount ELSE 0 END) open_pipeline
FROM salesforce_opportunities GROUP BY Industry ORDER BY won_revenue DESC;

-- 6. Lead source quality
SELECT Lead_Source, COUNT(*) opportunities,
 AVG(CASE WHEN Stage='Closed Won' THEN 1.0 WHEN Stage='Closed Lost' THEN 0.0 END) win_rate,
 SUM(CASE WHEN Stage='Closed Won' THEN Amount ELSE 0 END) won_revenue
FROM salesforce_opportunities GROUP BY Lead_Source ORDER BY win_rate DESC NULLS LAST;

-- 7. Aging buckets
SELECT CASE WHEN Age_Days<=30 THEN '0-30' WHEN Age_Days<=60 THEN '31-60'
 WHEN Age_Days<=90 THEN '61-90' WHEN Age_Days<=120 THEN '91-120' ELSE '121+' END age_bucket,
 COUNT(*) deals, SUM(Amount) pipeline, SUM(Amount*Probability) weighted_pipeline
FROM salesforce_opportunities
WHERE Stage NOT IN ('Closed Won','Closed Lost')
GROUP BY 1 ORDER BY MIN(Age_Days);

-- 8. Stale and overdue pipeline
SELECT Owner, SUM(Stale_Flag) stale_deals, SUM(Overdue_Flag) overdue_deals,
 SUM(CASE WHEN Stale_Flag=1 OR Overdue_Flag=1 THEN Amount ELSE 0 END) at_risk_pipeline
FROM salesforce_opportunities
WHERE Stage NOT IN ('Closed Won','Closed Lost')
GROUP BY Owner ORDER BY at_risk_pipeline DESC;

-- 9. Forecast categories
SELECT Forecast_Category, COUNT(*) deals, SUM(Amount) amount, SUM(Amount*Probability) weighted_amount
FROM salesforce_opportunities
WHERE Stage NOT IN ('Closed Won','Closed Lost')
GROUP BY Forecast_Category ORDER BY weighted_amount DESC;

-- 10. High-value risk queue
SELECT Opportunity, Owner, Stage, Amount, Probability, Close_Date, Age_Days, Days_Since_Activity,
 Stale_Flag, Overdue_Flag, Risk_Score
FROM salesforce_opportunities
WHERE Stage NOT IN ('Closed Won','Closed Lost')
ORDER BY Risk_Score DESC, Amount DESC;

-- 11. Pipeline coverage
-- Replace 2000000 with a governed quota table in production.
SELECT SUM(Amount)/2000000.0 AS pipeline_coverage
FROM salesforce_opportunities
WHERE Stage NOT IN ('Closed Won','Closed Lost');

-- 12. Forecast sensitivity
SELECT
 SUM(CASE WHEN Stage NOT IN ('Closed Won','Closed Lost') THEN Amount*Probability ELSE 0 END) base_weighted,
 SUM(CASE WHEN Stage NOT IN ('Closed Won','Closed Lost') THEN Amount*LEAST(1,Probability+0.10) ELSE 0 END) improved_probability_case
FROM salesforce_opportunities;
