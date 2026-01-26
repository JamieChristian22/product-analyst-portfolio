import pandas as pd

df = pd.read_csv("../data/conversion_funnel_events.csv")

# Funnel counts
funnel = df.groupby("event")["user_id"].nunique()
print("Funnel Users by Stage:")
print(funnel)

# Revenue by device
rev_device = df[df["event"]=="purchase"].groupby("device")["revenue"].sum()
print("\nRevenue by Device:")
print(rev_device)

# Conversion rate
views = funnel.get("view", 1)
purchases = funnel.get("purchase", 0)
conversion_rate = purchases / views
print(f"\nOverall Conversion Rate: {conversion_rate:.2%}")