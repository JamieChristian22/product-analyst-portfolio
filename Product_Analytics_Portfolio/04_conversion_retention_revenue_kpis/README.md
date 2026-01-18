# Conversion, Retention & Revenue KPI Overview

## Business Problem
Provide a KPI overview that connects:
- Acquisition channel performance
- Conversion to paid
- 30-day retention
- Revenue by plan and channel

## Datasets
- `/data/kpi_users.csv` (user-level KPI dataset)
- `/data/marketing_spend_daily.csv` (CAC/ROI-style model inputs)

## Key KPIs
- Conversion Rate (to paid)
- Retention Rate (30d)
- Total Revenue, ARPPU (proxy)
- Channel ROI = (Attributed Revenue - Spend) / Spend

## How to Run
- SQL: `/sql/kpi_overview.sql`
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