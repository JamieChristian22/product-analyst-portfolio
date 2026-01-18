# Ecommerce Funnel Optimization

## Business Problem
Improve purchase conversion by identifying **where users drop off** and which segments (device, category, country) underperform.

## Dashboard
See `/screenshots/` for the funnel page screenshot and `/dashboard/` for the packaged dashboard file.

## Dataset
`/data/ecommerce_events.csv` is an event-level dataset designed to power:
- Funnel counts (Viewed → Add to Cart → Checkout Started → Purchased)
- Conversion rates by device/category/country
- Drop-off volume by stage

## Key KPIs
- View → Cart %
- Cart → Checkout %
- Checkout → Purchase %
- Overall conversion %
- Drop-off volume by stage

## What I Found (example insights supported by the dataset)
- The largest **volume** drop-off occurs at the **View → Add to Cart** stage
- Mobile drives the majority of purchases, but conversion can lag if PDP UX is weak

## Recommendations
1. A/B test product page (trust signals, reviews, shipping clarity)
2. Introduce bundle pricing for top categories
3. Improve mobile PDP speed + CTA placement

## How to Run
- SQL: `/sql/funnel_kpis.sql`
- Python: `cd python && pip install -r requirements.txt && python main.py`


---

## Simulated Data Disclosure

This project uses **simulated datasets** designed to reflect realistic business behavior.
The purpose is to demonstrate:
- Real-world analytical workflows  
- KPI logic and metric framing  
- Modeling, forecasting, and decision support  
- SQL, Python, and Excel techniques used in professional environments  

All analysis, structure, and methodology mirror how real analytics work is performed in industry.