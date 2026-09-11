# Data Dictionary

| Column | Type | Description |
|---|---|---|
| event_date | date | Event date |
| year_month | text | Reporting month in YYYY-MM format |
| country | text | Session geography |
| category | text | Product category |
| device_type | text | Mobile, Desktop, or Tablet |
| user_id | text | Simulated user identifier |
| session_id | text | Unique session identifier |
| event_name | text | viewed, add_to_cart, checkout_started, purchased |
| quantity | numeric | Units purchased; populated on purchase events |
| unit_price | numeric | Unit price; populated on purchase events |
| revenue | numeric | Purchase revenue = quantity × unit price |

## Event Taxonomy
1. `viewed` — product detail page viewed
2. `add_to_cart` — product added to cart
3. `checkout_started` — user entered checkout
4. `purchased` — order completed

## Grain
Raw data grain is **one row per session event**. Analytical funnel grain is **one row per session**.
