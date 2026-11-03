"""Protect funnel arithmetic and published synthetic evidence from invalid inputs."""
import csv
import importlib.util
import math
from pathlib import Path
import unittest

import pandas as pd

ROOT = Path(__file__).resolve().parents[1]
MODULE = ROOT / "01_ecommerce_funnel_optimization/python/main.py"
spec = importlib.util.spec_from_file_location("funnel_runner", MODULE)
runner = importlib.util.module_from_spec(spec)
spec.loader.exec_module(runner)
OUTPUT = ROOT / "01_ecommerce_funnel_optimization/outputs"


class FunnelMathTests(unittest.TestCase):
    def test_empty_purchase_segment_has_finite_zero_aov(self):
        rows = pd.DataFrame({"purchased": [0, 0], "add_to_cart": [1, 0],
                             "checkout_started": [0, 0], "revenue": [0.0, 0.0]})
        report = runner.metrics(rows)
        self.assertEqual(report["purchased"], 0)
        self.assertEqual(report["aov"], 0.0)
        self.assertTrue(math.isfinite(report["aov"]))

    def test_ztest_rejects_invalid_cohort_sizes(self):
        for args in ((0, 0, 0, 4), (1, 5, 1, 0), (6, 5, 2, 5),
                     (-1, 5, 2, 5), (1.5, 5, 1, 5),
                     (1, float("inf"), 2, 5)):
            with self.subTest(args=args):
                with self.assertRaises(ValueError):
                    runner.ztest_two_proportions(*args)

    def test_ztest_zero_variance_is_not_significant(self):
        for args in ((0, 10, 0, 12), (10, 10, 12, 12)):
            self.assertEqual(runner.ztest_two_proportions(*args), (0.0, 1.0))

    def test_ztest_regular_case_is_finite(self):
        z, p = runner.ztest_two_proportions(40, 100, 25, 100)
        self.assertGreater(z, 0)
        self.assertTrue(math.isfinite(z))
        self.assertTrue(0 <= p <= 1)


class PublishedFunnelChecks(unittest.TestCase):
    def test_funnel_counts_percentages_and_dropoff_reconcile(self):
        with (OUTPUT / "funnel_overall.csv").open(newline="", encoding="utf-8-sig") as fh:
            rows = list(csv.DictReader(fh))
        self.assertEqual([r["stage"] for r in rows],
                         ["Viewed", "Added to Cart", "Checkout Started", "Purchased"])
        counts = [int(r["sessions"]) for r in rows]
        self.assertTrue(all(a >= b >= 0 for a, b in zip(counts, counts[1:])))
        self.assertGreater(counts[0], 0)
        for i, row in enumerate(rows):
            with self.subTest(stage=row["stage"]):
                previous = counts[i - 1] if i else counts[0]
                self.assertAlmostEqual(float(row["pct_of_viewers"]), 100 * counts[i] / counts[0], places=5)
                self.assertAlmostEqual(float(row["step_conversion_pct"]), 100 * counts[i] / previous, places=5)
                self.assertEqual(int(row["dropoff_from_prior"]),
                                 previous - counts[i] if i else 0)

    def test_observed_segment_comparison_is_arithmetically_consistent(self):
        with (OUTPUT / "statistical_check.csv").open(newline="", encoding="utf-8-sig") as fh:
            values = list(csv.DictReader(fh))
        self.assertEqual(len(values), 1)
        r = values[0]
        self.assertAlmostEqual(
            float(r["absolute_difference_pp"]),
            float(r["desktop_conversion_pct"]) - float(r["mobile_conversion_pct"]), places=5)
        self.assertTrue(0 <= float(r["p_value"]) <= 1)
        self.assertEqual(r["statistically_significant_at_0_05"].lower() == "true",
                         float(r["p_value"]) < 0.05)


if __name__ == "__main__":
    unittest.main()
