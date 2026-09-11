# Unit Economics Deep Dive

## Why this layer matters
The observed portfolio period shows negative ROI because attributed revenue is lower than marketing spend. That is a decision signal—not a result to hide.

## Observed Economics
The project therefore separates **observed-period economics** from **forward-looking scenario economics**.

## Scenario Assumptions
- Gross margin: **78%**
- Monthly paid retention: **90%**
- Implied monthly churn: **10%**
- Simplified expected lifetime: **10.0 months**

These are explicit analytical assumptions, not claims about a real business.

## Formulas
- Gross-margin-adjusted LTV scenario = ARPPU × gross margin × expected lifetime months
- LTV:CAC scenario = gross-margin-adjusted LTV / CAC
- CAC payback scenario = CAC / (ARPPU × gross margin)
- Break-even monthly ARPPU = CAC / gross margin

## Decision Standard
**Scale:** strong LTV:CAC and acceptable payback.
**Optimize/Test:** promising economics, but validate before scaling.
**Investigate:** near break-even or uncertain.
**Reduce/Pause:** economics do not support incremental spend.

The purpose is to demonstrate capital-allocation judgment, not to manufacture profitable numbers.
