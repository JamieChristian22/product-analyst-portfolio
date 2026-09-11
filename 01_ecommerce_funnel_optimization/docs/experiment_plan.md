# Experiment Plan — Mobile Product Detail Page Conversion

## Business Problem
Mobile has a lower purchase conversion rate than desktop in the simulated dataset. The goal is to determine whether product-page friction is suppressing cart intent.

## Hypothesis
Making the primary CTA more prominent and presenting shipping/trust information earlier will increase View → Cart conversion for mobile sessions.

## Population
Eligible mobile product-view sessions.

## Variants
- **Control:** Existing PDP layout.
- **Treatment:** Sticky Add-to-Cart CTA + shipping estimate + trust/review summary above the fold.

## Primary Metric
View → Cart conversion rate.

## Secondary Metrics
- Overall purchase conversion
- Revenue per session
- Cart → Checkout conversion
- Checkout → Purchase conversion

## Guardrails
- AOV
- Page performance
- Error rate
- Cancellation/refund rate if available
- Customer-support contact rate if available

## Success Criteria
- Minimum **5% relative lift** in View → Cart conversion.
- 95% confidence / α = 0.05.
- No material deterioration in downstream checkout conversion or AOV.

## Measurement Design
Randomize at user level where possible to avoid users seeing both variants across sessions. Run until the pre-calculated sample-size threshold is met and through at least one full business cycle to reduce weekday/weekend bias.

## Interpretation
A statistically significant lift in View → Cart is not enough by itself. Ship only if the treatment also preserves purchase conversion quality and revenue/session.
