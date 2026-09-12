# Product Experiment Plan — Next-Best-Action Workflow

## Problem
Sales representatives can lose momentum when opportunities have no timely next action, become stale, or carry outdated close dates.

## Hypothesis
A Salesforce next-best-action experience that surfaces stale/high-value opportunities and prompts a concrete follow-up will reduce stale-opportunity rate and improve stage progression.

## Control
Existing Salesforce opportunity workflow.

## Treatment
- Priority work queue
- Stale-deal alert
- Suggested next action
- Close-date hygiene prompt
- Manager escalation for high-value risk

## Primary Product Metric
Stale-opportunity rate.

## Secondary Metrics
Stage progression, days since activity, overdue-close-date rate, weighted-pipeline progression, Closed Won conversion.

## Guardrails
Rep task burden, alert dismissal rate, false-positive escalation rate, CRM data completeness.

## Decision
Ship only if workflow health improves without creating excessive rep burden or alert fatigue.
