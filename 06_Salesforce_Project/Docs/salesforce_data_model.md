# Salesforce CRM Data Model

## Opportunity
Opportunity, Account, Owner, Stage, Amount, Probability, Forecast Category, Created Date, Close Date, Last Activity Date.

## Derived Analytics Fields
Age Days, Days Since Activity, Weighted Pipeline, Stale Flag, Overdue Flag, Risk Score.

## Production Relationships
Opportunity → Account; Opportunity → User/Owner; Opportunity → Lead Source/Campaign; Opportunity → Activity/Task/Event; Opportunity → Opportunity History.

This portfolio dataset is flattened for analysis. A production Salesforce warehouse should preserve IDs, history, timestamps, and slowly changing attributes.
