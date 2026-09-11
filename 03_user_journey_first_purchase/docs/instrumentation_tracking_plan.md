# Product Instrumentation & Tracking Plan

| Event | Trigger | Required Properties |
|---|---|---|
| first_touch | First attributable visit | user_id/anonymous_id, timestamp, medium, campaign, device |
| product_view | Product viewed | product_id, category, price, source_page |
| add_to_cart | Item added | product_id, quantity, cart_value |
| checkout_start | Checkout initiated | cart_value, item_count, device |
| purchase | First completed order | order_id, revenue, quantity, discount |
| return_session | User returns before purchase | days_since_first_touch, prior_session_count |
| experiment_exposure | Experiment assignment | experiment_id, variant, timestamp |

QA rules cover identity reconciliation, duplicate events, attribution versioning, revenue reconciliation, and exposure-before-treatment validation.
