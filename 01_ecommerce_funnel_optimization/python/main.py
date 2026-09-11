"""
E-commerce Funnel Optimization — Corporate Product Analytics Runner

Run:
    pip install -r requirements.txt
    python main.py

Outputs:
    ../outputs/funnel_overall.csv
    ../outputs/funnel_by_device.csv
    ../outputs/funnel_by_category.csv
    ../outputs/funnel_by_country.csv
    ../outputs/funnel_by_month.csv
    ../outputs/opportunity_sizing.csv
    ../outputs/statistical_check.csv
    ../outputs/charts/*.png
"""
from pathlib import Path
import math
import pandas as pd
import matplotlib.pyplot as plt
from scipy import stats

ROOT = Path(__file__).resolve().parents[1]
DATA_PATH = ROOT / "data" / "ecommerce_events.csv"
OUT = ROOT / "outputs"
CHARTS = OUT / "charts"

STAGES = ["viewed","add_to_cart","checkout_started","purchased"]

def load_events():
    df = pd.read_csv(DATA_PATH)
    required = {"event_date","year_month","country","category","device_type","user_id","session_id","event_name","revenue"}
    missing = required - set(df.columns)
    if missing:
        raise ValueError(f"Missing required columns: {sorted(missing)}")
    df["event_date"] = pd.to_datetime(df["event_date"])
    return df

def build_sessions(events):
    flags = (
        events.assign(value=1)
        .pivot_table(index="session_id", columns="event_name", values="value", aggfunc="max", fill_value=0)
        .reset_index()
    )
    for s in STAGES:
        if s not in flags.columns:
            flags[s] = 0
    dims = (
        events.sort_values("event_date")
        .groupby("session_id", as_index=False)
        .agg(
            event_date=("event_date","min"),
            year_month=("year_month","max"),
            country=("country","max"),
            category=("category","max"),
            device_type=("device_type","max"),
            user_id=("user_id","max"),
            revenue=("revenue","sum")
        )
    )
    return dims.merge(flags[["session_id"]+STAGES], on="session_id", how="left")

def metrics(df):
    viewed = len(df)
    cart = int(df["add_to_cart"].sum())
    checkout = int(df["checkout_started"].sum())
    purchase = int(df["purchased"].sum())
    revenue = float(df["revenue"].sum())
    return {
        "viewed": viewed,
        "added_to_cart": cart,
        "checkout_started": checkout,
        "purchased": purchase,
        "view_to_cart_pct": cart/viewed*100 if viewed else 0,
        "cart_to_checkout_pct": checkout/cart*100 if cart else 0,
        "checkout_to_purchase_pct": purchase/checkout*100 if checkout else 0,
        "overall_conversion_pct": purchase/viewed*100 if viewed else 0,
        "revenue": revenue,
        "aov": float(df.loc[df.purchased.eq(1),"revenue"].mean()),
        "revenue_per_session": revenue/viewed if viewed else 0,
    }

def segment_table(sessions, column):
    records=[]
    for key, group in sessions.groupby(column):
        records.append({column:key, "sessions":len(group), **metrics(group)})
    return pd.DataFrame(records).sort_values("overall_conversion_pct", ascending=False)

def ztest_two_proportions(success_a, n_a, success_b, n_b):
    pooled=(success_a+success_b)/(n_a+n_b)
    se=math.sqrt(pooled*(1-pooled)*(1/n_a+1/n_b))
    z=((success_a/n_a)-(success_b/n_b))/se
    p=2*(1-stats.norm.cdf(abs(z)))
    return z,p

def main():
    OUT.mkdir(exist_ok=True)
    CHARTS.mkdir(exist_ok=True)

    events = load_events()
    sessions = build_sessions(events)
    overall = metrics(sessions)

    funnel = pd.DataFrame({
        "stage":["Viewed","Added to Cart","Checkout Started","Purchased"],
        "sessions":[overall["viewed"],overall["added_to_cart"],overall["checkout_started"],overall["purchased"]],
        "step_conversion_pct":[100,overall["view_to_cart_pct"],overall["cart_to_checkout_pct"],overall["checkout_to_purchase_pct"]]
    })
    funnel["pct_of_viewers"] = funnel["sessions"]/overall["viewed"]*100
    funnel.to_csv(OUT/"funnel_overall.csv", index=False)

    for col,name in [("device_type","device"),("category","category"),("country","country"),("year_month","month")]:
        segment_table(sessions,col).to_csv(OUT/f"funnel_by_{name}.csv", index=False)

    # opportunity sizing
    aov=overall["aov"]
    transitions=[
        ("View → Add to Cart",overall["viewed"],overall["added_to_cart"],(overall["cart_to_checkout_pct"]/100)*(overall["checkout_to_purchase_pct"]/100)),
        ("Cart → Checkout",overall["added_to_cart"],overall["checkout_started"],overall["checkout_to_purchase_pct"]/100),
        ("Checkout → Purchase",overall["checkout_started"],overall["purchased"],1.0)
    ]
    opp=[]
    for name,start,end,downstream in transitions:
        recovered=(start-end)*0.10
        incr_purchases=recovered*downstream
        opp.append({
            "transition":name,
            "dropoff_sessions":start-end,
            "assumed_dropoff_recovery":0.10,
            "estimated_incremental_purchases":incr_purchases,
            "estimated_incremental_revenue":incr_purchases*aov
        })
    pd.DataFrame(opp).to_csv(OUT/"opportunity_sizing.csv",index=False)

    # significance: desktop vs mobile
    d=sessions[sessions.device_type.eq("Desktop")]
    m=sessions[sessions.device_type.eq("Mobile")]
    z,p=ztest_two_proportions(d.purchased.sum(),len(d),m.purchased.sum(),len(m))
    pd.DataFrame([{
        "comparison":"Desktop vs Mobile purchase conversion",
        "desktop_conversion_pct":d.purchased.mean()*100,
        "mobile_conversion_pct":m.purchased.mean()*100,
        "absolute_difference_pp":(d.purchased.mean()-m.purchased.mean())*100,
        "z_statistic":z,
        "p_value":p,
        "statistically_significant_at_0_05":p<0.05
    }]).to_csv(OUT/"statistical_check.csv",index=False)

    # charts
    plt.figure(figsize=(8,5))
    plt.bar(funnel["stage"],funnel["sessions"])
    plt.title("E-commerce Funnel — Session Counts")
    plt.ylabel("Sessions")
    plt.xticks(rotation=15)
    plt.tight_layout()
    plt.savefig(CHARTS/"funnel_counts.png",dpi=160)
    plt.close()

    dev=segment_table(sessions,"device_type")
    plt.figure(figsize=(7,4.5))
    plt.bar(dev["device_type"],dev["overall_conversion_pct"])
    plt.title("Purchase Conversion by Device")
    plt.ylabel("Conversion Rate (%)")
    plt.tight_layout()
    plt.savefig(CHARTS/"conversion_by_device.png",dpi=160)
    plt.close()

    print("Analysis complete.")
    print(pd.Series(overall).round(2))

if __name__ == "__main__":
    main()
