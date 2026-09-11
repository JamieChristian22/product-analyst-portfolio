# Instrumentation & Tracking Plan

Required events: signup, activation_milestone, pricing_view, trial_start, subscription_start, subscription_cancel, renewal, experiment_exposure.

Required properties: user_id, anonymous_id, timestamp, acquisition_channel, campaign, plan_type, price, experiment_id, variant.

QA: deduplicate subscription events; reconcile revenue to billing; version attribution logic; ensure experiment exposure precedes treatment; document retention eligibility windows.
