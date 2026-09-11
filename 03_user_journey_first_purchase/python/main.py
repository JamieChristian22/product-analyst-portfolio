from pathlib import Path
import math
import numpy as np
import pandas as pd
from scipy import stats

ROOT=Path(__file__).resolve().parents[1]
OUT=ROOT/"outputs"; OUT.mkdir(exist_ok=True)
df=pd.read_csv(ROOT/"data/first_purchase_journey.csv",parse_dates=["first_touch_date","first_purchase_date"])

def segment(col):
    return df.groupby(col).agg(
        users=("user_id","nunique"),
        avg_sessions_before_purchase=("sessions_before_purchase","mean"),
        avg_events_before_purchase=("events_before_purchase","mean"),
        median_journey_days=("journey_duration_days","median"),
        fast_purchase_7d_pct=("fast_purchase_7d","mean"),
        avg_first_purchase_revenue=("first_purchase_revenue","mean"),
        avg_revenue_per_session=("revenue_per_session","mean")
    ).reset_index()

for col,name in [("first_medium","medium"),("device_type","device"),("journey_segment","segment")]:
    segment(col).to_csv(OUT/f"journey_by_{name}.csv",index=False)

# Correlation
rho,p=stats.spearmanr(df.sessions_before_purchase,df.journey_duration_days)
pd.DataFrame([["Sessions before purchase","Journey duration days",rho,p]],
             columns=["metric_a","metric_b","spearman_rho","p_value"]).to_csv(OUT/"behavior_correlation.csv",index=False)

# Cohorts
df["cohort_month"]=df.first_touch_date.dt.to_period("M").astype(str)
df.groupby("cohort_month").agg(
    users=("user_id","nunique"),
    avg_sessions=("sessions_before_purchase","mean"),
    median_journey_days=("journey_duration_days","median"),
    fast_purchase_7d_pct=("fast_purchase_7d","mean"),
    avg_first_purchase_revenue=("first_purchase_revenue","mean")
).reset_index().to_csv(OUT/"monthly_journey_cohorts.csv",index=False)

# Bootstrap 95% CI
rng=np.random.default_rng(303); B=2500
med=[]; fast=[]; sessions=[]
for _ in range(B):
    s=df.sample(len(df),replace=True,random_state=int(rng.integers(0,2**31-1)))
    med.append(s.journey_duration_days.median()); fast.append(s.fast_purchase_7d.mean()); sessions.append(s.sessions_before_purchase.mean())
pd.DataFrame([
    ["Median journey duration",df.journey_duration_days.median(),np.percentile(med,2.5),np.percentile(med,97.5)],
    ["7-day purchase rate",df.fast_purchase_7d.mean(),np.percentile(fast,2.5),np.percentile(fast,97.5)],
    ["Average sessions",df.sessions_before_purchase.mean(),np.percentile(sessions,2.5),np.percentile(sessions,97.5)]
],columns=["metric","estimate","ci_95_lower","ci_95_upper"]).to_csv(OUT/"bootstrap_confidence_intervals.csv",index=False)

print(f"Users: {df.user_id.nunique():,}")
print(f"Median journey: {df.journey_duration_days.median():.2f} days")
print(f"7-day purchase: {df.fast_purchase_7d.mean():.1%}")
print(f"Sessions vs duration rho={rho:.3f}, p={p:.4g}")
