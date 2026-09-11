# Analytics QA Checklist

## Data Quality
- [x] Required columns validated
- [x] Session IDs present
- [x] Funnel event names constrained to approved taxonomy
- [x] Duplicate-event audit included in SQL
- [x] Impossible funnel sequence check included

## Metric Quality
- [x] Session-level funnel construction
- [x] Safe denominators / NULL protection
- [x] Segment sample sizes included
- [x] Revenue metrics tied to purchase sessions
- [x] Benchmarks documented

## Decision Quality
- [x] Largest bottleneck identified
- [x] Opportunity sized in sessions and revenue
- [x] Segment gap statistically checked
- [x] Recommendation mapped to experiment
- [x] Guardrail metrics included
- [x] Limitations disclosed
