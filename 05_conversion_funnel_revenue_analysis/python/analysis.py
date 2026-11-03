"""Ordered ecommerce funnel from synthetic user event data.

Run: python 05_conversion_funnel_revenue_analysis/python/analysis.py
A user contributes to a later stage only after qualifying for earlier stages.
Results describe the supplied synthetic journeys; they are not causal evidence.
"""
from __future__ import annotations

import json
import math
from pathlib import Path
import pandas as pd

ROOT = Path(__file__).resolve().parents[1]
SOURCE = ROOT / "data/conversion_funnel_events.csv"
OUT = ROOT / "outputs"
STAGES = ("view", "add_to_cart", "checkout", "purchase")
SEGMENTS = ("device", "medium", "country")


def ordered_funnel(events: pd.DataFrame) -> dict:
    """Use each user's first valid view as the start of one ordered journey.

    Events are ordered by timestamp and stable source position. A purchase with
    missing checkout is not a conversion. Repeated purchases after a completed
    journey contribute revenue but do not increase converted-user counts.
    """
    required = {"user_id", "event_date", "event", "device", "country", "medium", "revenue"}
    if events.empty or not required.issubset(events.columns):
        raise ValueError("Empty events or missing funnel source columns")
    frame = events.copy()
    if frame[list(required - {"revenue", "event_date"})].isna().any().any():
        raise ValueError("Missing event identifiers or segment values")
    frame["event_date"] = pd.to_datetime(frame["event_date"], errors="coerce")
    if frame["event_date"].isna().any():
        raise ValueError("Invalid event timestamp")
    frame["revenue"] = pd.to_numeric(frame["revenue"], errors="coerce")
    if frame["revenue"].isna().any() or not frame["revenue"].map(math.isfinite).all() or (frame["revenue"] < 0).any():
        raise ValueError("Revenue must be nonnegative and finite")
    if not frame["event"].isin(STAGES).all():
        raise ValueError("Unknown funnel event stage")
    if frame.loc[frame.event.ne("purchase"), "revenue"].gt(0).any():
        raise ValueError("Revenue on a non-purchase event requires source reconciliation")

    frame["_position"] = range(len(frame))
    frame = frame.sort_values(["user_id", "event_date", "_position"], kind="stable")
    users, ignored_future, missing_view = [], 0, 0
    for user_id, group in frame.groupby("user_id", sort=True):
        progress, first_view, first_purchase = 0, None, None
        purchase_events, revenue = 0, 0.0
        segments = {}
        for event in group.itertuples(index=False):
            stage = event.event
            if progress < len(STAGES) and stage == STAGES[progress]:
                progress += 1
                if stage == "view":
                    first_view = event.event_date
                    segments = {key: getattr(event, key) for key in SEGMENTS}
                if stage == "purchase":
                    first_purchase = event.event_date
                    purchase_events += 1
                    revenue += event.revenue
            elif progress == len(STAGES) and stage == "purchase":
                purchase_events += 1
                revenue += event.revenue
            elif STAGES.index(stage) > progress:
                ignored_future += 1
        if first_view is None:
            missing_view += 1
            continue
        users.append({
            "user_id": user_id, **segments, "stage_count": progress,
            "purchased": int(progress == len(STAGES)),
            "purchase_events": purchase_events, "revenue": revenue,
            "hours_to_first_purchase": (
                (first_purchase - first_view).total_seconds() / 3600
                if first_purchase is not None else None
            ),
        })
    if not users:
        raise ValueError("No viewed users with a qualifying funnel entry")
    people = pd.DataFrame(users)
    counts = [int((people["stage_count"] >= number).sum())
              for number in range(1, len(STAGES) + 1)]
    funnel = pd.DataFrame({
        "stage": STAGES,
        "unique_users": counts,
        "dropoff_from_prior": [0] + [counts[i-1] - counts[i] for i in range(1, len(counts))],
        "pct_of_viewers": [100*value/counts[0] for value in counts],
    })
    segmented = {}
    for dim in SEGMENTS:
        report = people.groupby(dim, dropna=False).agg(
            viewers=("user_id", "size"),
            purchasers=("purchased", "sum"),
            purchase_events=("purchase_events", "sum"),
            revenue=("revenue", "sum"),
        ).reset_index()
        report["conversion_rate"] = report["purchasers"] / report["viewers"]
        report["aov_per_purchase_event"] = report.apply(
            lambda row: row.revenue / row.purchase_events if row.purchase_events else None,
            axis=1)
        segmented[dim] = report.sort_values(dim)
    conversion = counts[-1] / counts[0]
    return {
        "funnel": funnel, "segments": segmented,
        "diagnostics": {
            "source_event_rows": len(frame),
            "viewed_users": counts[0],
            "converted_users": counts[-1],
            "conversion_rate": conversion,
            "qualified_purchase_events": int(people.purchase_events.sum()),
            "qualified_revenue": float(people.revenue.sum()),
            "users_without_view_excluded": missing_view,
            "out_of_order_future_events_ignored": ignored_future,
            "median_hours_to_first_purchase": (
                float(people["hours_to_first_purchase"].median())
                if people["hours_to_first_purchase"].notna().any() else None
            ),
            "interpretation": (
                "One ordered journey per unique user, first-view attribution, "
                "timestamp/source-row ordering, synthetic observational data."
            ),
        },
    }


def main() -> None:
    events = pd.read_csv(SOURCE)
    result = ordered_funnel(events)
    OUT.mkdir(parents=True, exist_ok=True)
    result["funnel"].to_csv(OUT / "ordered_funnel_python.csv", index=False)
    for dim, table in result["segments"].items():
        table.to_csv(OUT / f"{dim}_performance_python.csv", index=False)
    (OUT / "ordered_funnel_diagnostics.json").write_text(
        json.dumps(result["diagnostics"], indent=2, allow_nan=False) + "\n",
        encoding="utf-8")
    metrics = result["diagnostics"]
    print(f"Viewed users: {metrics['viewed_users']:,}")
    print(f"Ordered purchase conversions: {metrics['converted_users']:,} "
          f"({metrics['conversion_rate']:.2%})")
    print(f"Qualified revenue: ${metrics['qualified_revenue']:,.2f}")
    print(f"Excluded out-of-order events: {metrics['out_of_order_future_events_ignored']}")
    print("LIMIT: Synthetic observed user journeys; not randomized causal evidence.")


if __name__ == "__main__":
    main()
