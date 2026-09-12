# Instrumentation Plan
Track: product_view, add_to_cart, checkout_start, purchase, experiment_exposure.

Required properties: user_id/anonymous_id, timestamp, product_id, device, country, acquisition_medium, session_id, order_id, revenue, experiment_id, variant.

QA rules: chronological funnel ordering, purchase revenue only on purchase events, duplicate-event monitoring, experiment exposure before treatment, identity reconciliation.
