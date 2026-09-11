# KPI & Metric Dictionary

| Metric | Definition | Formula | Business Use |
|---|---|---|---|
| Viewed Sessions | Sessions with at least one product view | count(viewed sessions) | Top-of-funnel demand |
| Add-to-Cart Sessions | Sessions reaching cart intent | count(cart sessions) | Product/PDP effectiveness |
| Checkout Sessions | Sessions beginning checkout | count(checkout sessions) | Purchase intent |
| Purchase Sessions | Sessions completing purchase | count(purchase sessions) | Conversion outcome |
| View → Cart % | Share of viewers who add to cart | cart / viewed | PDP/product appeal |
| Cart → Checkout % | Share of carts that begin checkout | checkout / cart | Cart friction |
| Checkout → Purchase % | Share of checkout starters who purchase | purchase / checkout | Checkout effectiveness |
| Overall Conversion % | Share of viewing sessions that purchase | purchase / viewed | Primary product KPI |
| Drop-off Sessions | Sessions lost between stages | prior stage - next stage | Opportunity sizing |
| Revenue | Purchase revenue | sum(revenue) | Business outcome |
| AOV | Average revenue per purchase | revenue / purchases | Basket value |
| Revenue / Session | Revenue productivity | revenue / viewed sessions | Monetization efficiency |
| Conversion Gap | Segment conversion minus benchmark | segment CVR - overall CVR | Segment prioritization |

## Metric Governance Notes
- Funnel metrics are calculated at **session level**, not raw event-row level.
- Each stage is treated as a binary session flag to prevent duplicate events from inflating counts.
- Revenue is attributed only to sessions with a purchase event.
- Segment comparisons should consider both **conversion rate and sample size**.
- Statistical significance does not prove causality; controlled experiments are required for causal claims.
