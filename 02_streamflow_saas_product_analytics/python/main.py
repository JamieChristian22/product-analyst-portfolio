from pathlib import Path
import pandas as pd

ROOT=Path(__file__).resolve().parents[1]
df=pd.read_csv(ROOT/"data/streamflow_events.csv",parse_dates=["event_date"])
OUT=ROOT/"outputs"; OUT.mkdir(exist_ok=True)
df["date"]=df.event_date.dt.date
df["month"]=df.event_date.dt.to_period("M").astype(str)

daily=df.groupby("date").agg(dau=("user_id","nunique"),events=("event_name","size"),revenue_usd=("revenue_usd","sum")).reset_index()
daily.to_csv(OUT/"daily_product_health.csv",index=False)

total_users=df.user_id.nunique()
feature=df.groupby("event_name").agg(unique_users=("user_id","nunique"),event_count=("event_name","size")).reset_index()
feature["user_adoption_pct"]=feature.unique_users/total_users
feature.to_csv(OUT/"feature_adoption.csv",index=False)

user_events=df.groupby("user_id").event_name.agg(set)
activation=user_events.apply(lambda s: {"create_project","upload_video"}.issubset(s)).mean()
print(f"Users: {total_users:,}")
print(f"Activation proxy: {activation:.1%}")
print(f"Revenue: ${df.revenue_usd.sum():,.2f}")
