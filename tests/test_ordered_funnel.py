"""Regression coverage for ordered user-level conversion, attribution and revenue."""
import importlib.util
from pathlib import Path
import unittest

import pandas as pd

ROOT = Path(__file__).resolve().parents[1]
MODULE = ROOT / "05_conversion_funnel_revenue_analysis/python/analysis.py"
spec = importlib.util.spec_from_file_location("ordered_conversion", MODULE)
module = importlib.util.module_from_spec(spec)
spec.loader.exec_module(module)


def row(user, at, event, revenue=0, device="desktop", medium="organic", country="US"):
    return {"user_id": user, "event_date": at, "event": event,
            "device": device, "medium": medium, "country": country, "revenue": revenue}


class OrderedConversionTests(unittest.TestCase):
    def test_missing_prior_stage_does_not_count_purchase(self):
        events = pd.DataFrame([
            row("a", "2025-01-01 09:00", "view"),
            row("a", "2025-01-01 09:10", "add_to_cart"),
            row("a", "2025-01-01 09:20", "checkout"),
            row("a", "2025-01-01 09:30", "purchase", 100),
            row("b", "2025-01-01 09:00", "view"),
            row("b", "2025-01-01 09:20", "purchase", 50),
            row("c", "2025-01-01 09:10", "purchase", 80),
        ])
        report = module.ordered_funnel(events)
        self.assertEqual(report["funnel"]["unique_users"].tolist(), [2, 1, 1, 1])
        self.assertEqual(report["diagnostics"]["converted_users"], 1)
        self.assertEqual(report["diagnostics"]["qualified_revenue"], 100)
        self.assertEqual(report["diagnostics"]["users_without_view_excluded"], 1)
        self.assertGreater(report["diagnostics"]["out_of_order_future_events_ignored"], 0)

    def test_first_view_attribution_and_repeat_purchase_without_double_conversion(self):
        events = pd.DataFrame([
            row("one", "2025-01-01 08:00", "view", device="mobile"),
            row("one", "2025-01-01 08:15", "add_to_cart", device="desktop"),
            row("one", "2025-01-01 08:20", "checkout", device="desktop"),
            row("one", "2025-01-01 09:00", "purchase", 90, device="desktop"),
            row("one", "2025-01-01 09:10", "purchase", 10, device="desktop"),
        ])
        report = module.ordered_funnel(events)
        device = report["segments"]["device"].iloc[0]
        self.assertEqual(device["device"], "mobile")
        self.assertEqual(device["purchasers"], 1)
        self.assertEqual(device["purchase_events"], 2)
        self.assertEqual(device["revenue"], 100)
        self.assertEqual(device["aov_per_purchase_event"], 50)
        self.assertEqual(report["diagnostics"]["median_hours_to_first_purchase"], 1)

    def test_out_of_order_attempt_followed_by_valid_path(self):
        events = pd.DataFrame([
            row("one", "2025-01-01 08:00", "view"),
            row("one", "2025-01-01 08:05", "checkout"),
            row("one", "2025-01-01 08:10", "add_to_cart"),
            row("one", "2025-01-01 08:15", "checkout"),
            row("one", "2025-01-01 08:20", "purchase", 45),
        ])
        report = module.ordered_funnel(events)
        self.assertEqual(report["funnel"]["unique_users"].tolist(), [1, 1, 1, 1])
        self.assertEqual(report["diagnostics"]["out_of_order_future_events_ignored"], 1)

    def test_invalid_source_values_fail_closed(self):
        source = [
            row("x", "not-a-date", "view"),
            row("x", "2025-01-01 08:00", "unknown"),
            row("x", "2025-01-01 08:00", "view", revenue=15),
            row("x", "2025-01-01 08:00", "view", revenue=float("nan")),
        ]
        for invalid in source:
            with self.subTest(invalid=invalid), self.assertRaises(ValueError):
                module.ordered_funnel(pd.DataFrame([invalid]))


if __name__ == "__main__":
    unittest.main()
