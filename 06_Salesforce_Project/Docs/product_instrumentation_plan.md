# Product Instrumentation Plan

## Events
- opportunity_created
- stage_changed
- next_action_created
- next_action_completed
- opportunity_viewed
- risk_alert_shown
- risk_alert_clicked
- close_date_updated
- forecast_category_changed
- opportunity_closed

## Core Properties
opportunity_id, account_id, owner_id, timestamp, prior_stage, new_stage, amount, probability, forecast_category, risk_tier, source, industry, experiment_id, variant.

## Product Analytics Uses
- Funnel progression
- Time-to-stage
- Feature adoption of priority queue/alerts
- Alert engagement
- Workflow completion
- Experiment measurement
- Cohort comparison by owner/segment

## QA
Deduplicate events, preserve event order, reconcile opportunity state with Salesforce records, and ensure experiment exposure occurs before treatment behavior.
