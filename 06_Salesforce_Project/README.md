<div align="center">

# ⚙️ Salesforce Product & Pipeline Analytics

## Internal Product Analytics • CRM Workflow • Pipeline Health • Revenue Operations

![Project](https://img.shields.io/badge/PROJECT_06-SALESFORCE_ANALYTICS-2563EB?style=for-the-badge)
![Status](https://img.shields.io/badge/STATUS-PORTFOLIO_READY-16A34A?style=for-the-badge)
![Focus](https://img.shields.io/badge/FOCUS-INTERNAL_PRODUCT_ANALYTICS-7C3AED?style=for-the-badge)

<br>

![Salesforce](https://img.shields.io/badge/SALESFORCE-CRM_ANALYTICS-00A1E0?style=flat-square\&logo=salesforce\&logoColor=white)
![SQL](https://img.shields.io/badge/SQL-PIPELINE_ANALYSIS-336791?style=flat-square\&logo=postgresql\&logoColor=white)
![Python](https://img.shields.io/badge/PYTHON-RISK_ANALYTICS-3776AB?style=flat-square\&logo=python\&logoColor=white)
![Excel](https://img.shields.io/badge/EXCEL-DECISION_CENTER-217346?style=flat-square\&logo=microsoftexcel\&logoColor=white)
![Product](https://img.shields.io/badge/PRODUCT-WORKFLOW_OPTIMIZATION-9333EA?style=flat-square)
![Revenue](https://img.shields.io/badge/BUSINESS-PIPELINE_%26_FORECAST-F59E0B?style=flat-square)

### 💡 *Treating Salesforce as an internal product — and using product analytics to improve workflow quality, pipeline health, and revenue execution.*

</div>

---

# 🚦 Executive Snapshot

|                             |                                                                             |
| --------------------------- | --------------------------------------------------------------------------- |
| 🎯 **Product Problem**      | Sales teams need clearer prioritization and healthier opportunity workflows |
| 👤 **Primary User**         | Sales Representative / Manager                                              |
| ⚙️ **Internal Product**     | Salesforce Opportunity Workflow                                             |
| 📊 **Core Product Metrics** | Stage Progression • Stale Rate • Overdue Rate • Workflow Completion         |
| 💰 **Business Metrics**     | Open Pipeline • Weighted Pipeline • Win Rate • Closed-Won Revenue           |
| ⚠️ **Risk Lens**            | Stale • Overdue • High-Risk Opportunities                                   |
| 🎯 **Product Opportunity**  | Next-Best-Action Workflow                                                   |
| 🧪 **Validation Method**    | Controlled Workflow Experiment                                              |
| 🧰 **Core Tools**           | Salesforce • SQL • Python • Excel                                           |

---

# 🧠 Product Analytics Mission

This project asks a different Product Analytics question:

> **How can an internal CRM product help sales users identify the right opportunity, take the right action, and move revenue through the pipeline more effectively?**

Rather than treating Salesforce as only a reporting database, this project treats it as a **product used by employees**.

The analytical workflow connects:

**👤 User Workflow → ⚙️ CRM Behavior → ⚠️ Friction → 🎯 Product Intervention → 📈 Pipeline Progression → 💰 Revenue Outcome**

---

# 🏆 Internal Product Analytics Framework

![Framework](https://img.shields.io/badge/FRAMEWORK-WORKFLOW_%E2%86%92_FRICTION_%E2%86%92_ACTION_%E2%86%92_REVENUE-7C3AED?style=for-the-badge)

This project evaluates Salesforce across two connected systems.

## ⚙️ Product System

How sales users interact with the CRM.

## 💰 Revenue System

How opportunities progress toward Closed Won.

The core principle is:

> **Better CRM workflows should make it easier for users to take productive actions that improve business outcomes.**

---

# 🔄 Salesforce Opportunity Journey

<div align="center">

## 🆕 OPPORTUNITY CREATED

### ↓

## 🔎 QUALIFICATION

### ↓

## 🤝 DISCOVERY

### ↓

## 📄 PROPOSAL

### ↓

## 💬 NEGOTIATION

### ↓

## 🏆 CLOSED WON

</div>

Each stage represents both:

* A **sales pipeline state**
* A **user workflow state inside Salesforce**

This enables Product Analytics to evaluate where the internal experience may be slowing down execution.

---

# 📊 Executive KPI Framework

## 💰 Open Pipeline

Measures the total value of active opportunities.

### Business Question

> **How much potential revenue currently exists in the sales pipeline?**

---

## ⚖️ Weighted Pipeline

```text
Weighted Pipeline
=
Opportunity Amount × Stage Probability
```

### Business Question

> **What is the probability-adjusted value of the active pipeline?**

Weighted pipeline helps support:

* Forecasting
* Prioritization
* Coverage analysis
* Resource allocation

---

## 🏆 Closed-Won Revenue

Measures the value of successfully converted opportunities.

### Business Question

> **How much pipeline value became realized revenue?**

---

## 📈 Win Rate

```text
Win Rate
=
Closed Won
÷
(Closed Won + Closed Lost)
```

### Business Question

> **How efficiently are qualified opportunities becoming revenue?**

---

# ⚠️ Stale Opportunity Rate

A stale opportunity is an open deal without recent activity beyond a defined threshold.

### Product Question

> **How often does the Salesforce workflow allow opportunities to sit without meaningful follow-up?**

Stale rate is especially valuable because it connects:

**CRM Behavior → Workflow Friction → Pipeline Risk**

---

# ⏰ Overdue Opportunity Rate

Measures opportunities whose expected close timing has passed while the deal remains open.

### Product Question

> **Are users maintaining accurate opportunity timelines and next steps?**

High overdue rates may indicate:

* Weak workflow reminders
* Poor close-date hygiene
* Low manager visibility
* Rep prioritization problems
* Process ambiguity

---

# 🔬 Analytical Framework

The project follows ten analytical layers.

---

## 1️⃣ Pipeline Health

![Layer](https://img.shields.io/badge/LAYER_01-PIPELINE_HEALTH-2563EB?style=flat-square)

Analyze:

* Open pipeline
* Weighted pipeline
* Closed-Won revenue
* Closed-Lost value
* Win rate

### Question

> **How healthy is the current opportunity pipeline?**

---

## 2️⃣ Stage Progression

![Layer](https://img.shields.io/badge/LAYER_02-STAGE_PROGRESSION-7C3AED?style=flat-square)

Analyze movement through:

**Created → Qualification → Discovery → Proposal → Negotiation → Closed Won**

### Product Question

> **Where does workflow progression slow down?**

---

## 3️⃣ Opportunity Aging

![Layer](https://img.shields.io/badge/LAYER_03-PIPELINE_AGING-F59E0B?style=flat-square)

Evaluate:

* Opportunity age
* Time since activity
* Open-deal aging buckets

### Question

> **Which deals are becoming increasingly difficult to move?**

---

## 4️⃣ Stale Deal Analysis

![Layer](https://img.shields.io/badge/LAYER_04-STALE_OPPORTUNITIES-DC2626?style=flat-square)

Identify open opportunities with extended inactivity.

### Product Question

> **Where should Salesforce proactively help the user re-engage?**

---

## 5️⃣ Overdue Analysis

![Layer](https://img.shields.io/badge/LAYER_05-OVERDUE_PIPELINE-9333EA?style=flat-square)

Analyze opportunities that remain open beyond expected close timing.

### Product Question

> **Where is CRM process hygiene breaking down?**

---

## 6️⃣ Owner Performance

![Layer](https://img.shields.io/badge/LAYER_06-OWNER_PERFORMANCE-059669?style=flat-square)

Compare pipeline and outcome metrics by owner.

### Questions

* Who maintains healthier pipelines?
* Which reps carry more stale opportunities?
* Where may workflow coaching be useful?
* Are pipeline-quality differences operational rather than market-driven?

---

## 7️⃣ Industry & Lead Source

![Layer](https://img.shields.io/badge/LAYER_07-SEGMENT_PERFORMANCE-0891B2?style=flat-square)

Compare:

* Industry
* Lead source
* Revenue
* Win rate
* Pipeline quality

### Question

> **Which opportunity types create stronger pipeline outcomes?**

---

## 8️⃣ Forecast Quality

![Layer](https://img.shields.io/badge/LAYER_08-FORECAST_ANALYTICS-111827?style=flat-square)

Evaluate:

* Pipeline
* Best Case
* Commit
* Closed
* Omitted

### Question

> **How much confidence should leadership place in the current pipeline forecast?**

---

## 9️⃣ Opportunity Prioritization

![Layer](https://img.shields.io/badge/LAYER_09-PRIORITY_QUEUE-DC2626?style=flat-square)

Combine:

* Opportunity value
* Probability
* Staleness
* Overdue status
* Deal age
* Risk score

to create a **priority queue**.

### Product Question

> **Which opportunity should the user work on next?**

---

## 🔟 Product Workflow Analytics

![Layer](https://img.shields.io/badge/LAYER_10-INTERNAL_PRODUCT_ANALYTICS-7C3AED?style=flat-square)

Analyze Salesforce as a product.

Focus on:

* User behavior
* Workflow completion
* Alert interaction
* Next-action completion
* CRM data hygiene
* Stage progression
* Product feature adoption

### Product Question

> **How can Salesforce reduce cognitive load and make productive sales actions easier?**

---

# 🔥 Core Product Insight

![Insight](https://img.shields.io/badge/KEY_INSIGHT-PIPELINE_RISK_IS_A_WORKFLOW_PROBLEM_TOO-DC2626?style=for-the-badge)

Pipeline risk is not only a sales-performance problem.

It can also reflect weaknesses in the internal product experience.

For example:

A user may know they have dozens of opportunities.

But the CRM may not clearly answer:

> **Which deal requires attention right now?**

That creates a Product Analytics opportunity.

---

# 🎯 Primary Product Opportunity

![Opportunity](https://img.shields.io/badge/PRODUCT_OPPORTUNITY-NEXT_BEST_ACTION-7C3AED?style=for-the-badge)

## Build a Salesforce Opportunity Health Workspace

The product experience should help users quickly answer:

### 🔥 What requires attention?

### ⚠️ What is at risk?

### ⏰ What is overdue?

### 📈 What is most likely to progress?

### 💰 What has the greatest business value?

---

# 🧭 Next-Best-Action Experience

Potential components include:

## 🎯 Priority Opportunity Queue

Rank opportunities using:

* Revenue value
* Stage
* Probability
* Age
* Staleness
* Overdue status

---

## 🔔 Stale Deal Alerts

Notify users when important opportunities have not received recent activity.

---

## 📅 Close-Date Hygiene

Prompt users when expected close dates become stale or unrealistic.

---

## 💡 Suggested Next Action

Provide contextual workflow guidance.

Examples:

* Follow up with buyer
* Schedule discovery
* Update proposal
* Confirm close timing
* Update forecast category

---

## 🚨 Manager Escalation

Surface high-value, high-risk opportunities for manager review.

---

# 📊 Internal Product Funnel

![ProductFunnel](https://img.shields.io/badge/PRODUCT_FUNNEL-CREATED_%E2%86%92_WON-9333EA?style=for-the-badge)

A dedicated Product Analytics funnel can measure:

### 1. Opportunity Created

### 2. Qualification Reached

### 3. Discovery Reached

### 4. Proposal Reached

### 5. Negotiation Reached

### 6. Closed Won

This reframes traditional pipeline reporting as a **workflow conversion funnel**.

### Product Question

> **Where do users and opportunities stop progressing?**

---

# 📐 Product Metric Framework

## 🎯 Primary Product Metric

### Stale Opportunity Rate

Why?

Because it directly represents an important workflow problem:

> Opportunities exist, but productive user action has stopped.

---

## 📊 Secondary Product Metrics

* Stage progression
* Days since last activity
* Overdue opportunity rate
* Next-action completion
* Pipeline progression
* Closed-Won conversion

---

## 💰 Business Outcomes

* Weighted pipeline
* Closed-Won revenue
* Win rate
* Forecast quality

---

## 🛡️ Guardrails

* Alert dismissal rate
* Rep task burden
* False-positive alerts
* CRM data completeness
* User adoption

---

# 🧪 Product Experiment

![Experiment](https://img.shields.io/badge/EXPERIMENT-NEXT_BEST_ACTION_WORKFLOW-9333EA?style=for-the-badge)

## Hypothesis

> Providing sales users with a prioritized opportunity queue, stale-deal alerts, and contextual next actions will reduce stale opportunity rates and improve pipeline progression.

---

## 🅰️ Control

Existing Salesforce opportunity workflow.

---

## 🅱️ Treatment

Opportunity Health Workspace including:

* Priority queue
* Stale-deal alerting
* Next-action suggestions
* Close-date hygiene prompts
* Risk indicators

---

# 📏 Experiment Measurement

## 🎯 Primary Metric

**Stale Opportunity Rate**

---

## 📊 Secondary Metrics

* Next-action completion
* Stage progression
* Days since activity
* Overdue opportunity rate
* Weighted pipeline progression
* Closed-Won conversion

---

## 🛡️ Guardrails

* Alert dismissal
* User task burden
* False-positive escalation
* Data completeness
* Workflow abandonment

---

# 🚨 Product Decision Rule

Do not ship because users click more alerts.

A successful workflow should produce:

**Stale Rate ↓**

plus

**Workflow Completion ↑**

plus

**Stage Progression healthy or ↑**

plus

**Business Outcomes healthy**

with

**User burden stable**

---

# 📡 Product Instrumentation

![Tracking](https://img.shields.io/badge/PRODUCT-INSTRUMENTATION-0891B2?style=for-the-badge)

A proper internal product analytics implementation should track events such as:

```text
opportunity_created
stage_changed
next_action_created
next_action_completed
opportunity_viewed
risk_alert_shown
risk_alert_clicked
close_date_updated
forecast_category_changed
opportunity_closed
```

Important properties may include:

* opportunity_id
* user_id
* stage
* amount
* probability
* risk_level
* days_since_activity
* forecast_category
* timestamp

### Principle

> **CRM data records what happened to the opportunity. Product instrumentation records how the user interacted with the workflow.**

---

# 🗺️ Product Roadmap

![Roadmap](https://img.shields.io/badge/ROADMAP-WORKFLOW_INTELLIGENCE-7C3AED?style=for-the-badge)

## 🔴 P0 — Priority Opportunity Queue

Help users identify the most important deal immediately.

---

## 🔴 P0 — Stale Deal Alerts

Surface high-value opportunities lacking recent action.

---

## 🔴 P0 — Close-Date Hygiene Prompt

Reduce outdated pipeline timing.

---

## 🟠 P1 — Next-Best-Action Suggestions

Recommend the most relevant workflow action.

---

## 🟠 P1 — Manager Risk Escalation

Surface high-value pipeline risk to leadership.

---

## 🟠 P1 — Forecast Change History

Make important opportunity and forecast changes easier to understand.

---

## 🟡 P2 — Predictive Risk Scoring

Potential future enhancement after strong behavioral instrumentation and validated workflow data exist.

### Governance Principle

> **Do not introduce machine learning simply because the problem contains a score.**

Start with transparent logic and validate that the workflow creates value first.

---

# ⚠️ Risk Scoring

![Risk](https://img.shields.io/badge/RISK-TRANSPARENT_HEURISTIC-DC2626?style=for-the-badge)

A simple opportunity risk score may combine:

* Staleness
* Overdue status
* Opportunity age
* Stage
* Probability
* Deal value

### Important

The score is a **transparent analytical heuristic**.

It is not presented as:

* Machine learning
* Predictive AI
* A causal model

### Principle

> **Interpretability matters when analytics influence user priorities.**

---

# 📈 Forecast & Pipeline Coverage

![Forecast](https://img.shields.io/badge/ANALYTICS-FORECAST_%26_COVERAGE-F59E0B?style=for-the-badge)

Pipeline coverage can be evaluated relative to a planning target.

```text
Pipeline Coverage
=
Open Pipeline
÷
Revenue Target
```

### Business Question

> **Is enough potential revenue entering and progressing through the pipeline to support the target?**

Coverage alone is not enough.

Pipeline quality also matters.

---

# 🧠 Product Decision Framework

![Decision](https://img.shields.io/badge/DECISION-WORKFLOW_%E2%86%92_BEHAVIOR_%E2%86%92_REVENUE-7C3AED?style=for-the-badge)

Every major insight follows:

### 🔍 Observation

What is happening in the pipeline?

### 📊 Evidence

Which metric demonstrates the problem?

### ⚙️ Workflow Friction

How is the internal product contributing?

### 🧠 Hypothesis

Why might users struggle?

### 💡 Product Recommendation

What should change in Salesforce?

### 🎯 Priority

Why should it be addressed now?

### 🧪 Experiment

How will the intervention be validated?

### 📏 Product Metric

What user behavior should improve?

### 🛡️ Guardrail

What must not deteriorate?

### 💰 Business Outcome

How could the workflow affect pipeline or revenue?

### ✅ Decision

Ship • Iterate • Stop • Investigate

---

# 💾 SQL Pipeline Analytics

![SQL](https://img.shields.io/badge/SQL-PIPELINE_%26_PRODUCT_ANALYTICS-336791?style=for-the-badge\&logo=postgresql\&logoColor=white)

SQL supports:

* Data-quality checks
* Stage analysis
* Pipeline value
* Weighted pipeline
* Win rate
* Opportunity aging
* Stale opportunities
* Overdue deals
* Owner performance
* Industry analysis
* Lead-source analysis
* Forecast coverage
* Opportunity prioritization

### Analytical Principle

> **Pipeline analytics should help a user or leader decide what action to take next.**

---

# 🐍 Python Analytics

![Python](https://img.shields.io/badge/PYTHON-RISK_%26_WORKFLOW_ANALYTICS-3776AB?style=for-the-badge\&logo=python\&logoColor=white)

Python supports:

* KPI calculations
* Opportunity segmentation
* Pipeline aging
* Risk logic
* Priority scoring
* Scenario analysis
* Product funnel outputs
* Reproducible QA

The emphasis is on reproducible analysis rather than decorative chart generation.

---

# 📗 Excel Product & Pipeline Decision Center

![Excel](https://img.shields.io/badge/EXCEL-PRODUCT_%26_PIPELINE_CENTER-217346?style=for-the-badge\&logo=microsoftexcel\&logoColor=white)

The stakeholder-facing workbook includes:

* Executive Dashboard
* Product Funnel
* Product Roadmap
* Product Experiment
* Pipeline Data
* Stage Analysis
* Forecast
* Aging
* Owner Performance
* Industry
* Lead Source
* Priority Queue
* Scenario Model
* KPI Dictionary
* Decision Log

Excel functions as both:

**⚙️ Internal Product Decision Center**

and

**💰 Revenue Operations Decision Center**

---

# 🗂️ Project Structure

```text
06_Salesforce_Project/
│
├── 📁 Data/
│   └── Salesforce opportunity dataset
│
├── 📁 SQL/
│   └── Salesforce pipeline analytics
│
├── 📁 Python/
│   ├── analysis.py
│   └── requirements.txt
│
├── 📁 Excel/
│   └── Salesforce_Product_and_Pipeline_Analytics_FINAL_10_10.xlsx
│
├── 📁 Outputs/
│   ├── stage_analysis.csv
│   ├── owner_performance.csv
│   ├── industry_performance.csv
│   ├── lead_source_performance.csv
│   ├── pipeline_aging.csv
│   ├── forecast_coverage.csv
│   ├── opportunity_priority.csv
│   ├── forecast_scenarios.csv
│   ├── product_funnel_health.csv
│   └── product_roadmap_priority.csv
│
├── 📁 Documentation/
│   ├── executive_summary.md
│   ├── metric_dictionary.md
│   ├── product_analytics_strategy.md
│   ├── product_requirements_brief.md
│   ├── product_instrumentation_plan.md
│   ├── product_experiment_plan.md
│   ├── product_roadmap.md
│   ├── stakeholder_readout.md
│   ├── analytics_qa_checklist.md
│   └── decision_log.md
│
└── 📄 README.md
```

---

# 📚 Documentation

![Docs](https://img.shields.io/badge/DOCUMENTATION-PRODUCT_%26_REVOPS_READY-0F766E?style=for-the-badge)

### 📄 Executive Summary

Translates pipeline analysis into an executive decision.

### 📐 Metric Dictionary

Defines pipeline, workflow, and Product Analytics metrics.

### ⚙️ Product Analytics Strategy

Defines Salesforce as an internal product and links user behavior to business outcomes.

### 📝 Product Requirements Brief

Translates workflow friction into product requirements.

### 📡 Product Instrumentation Plan

Defines user events required for internal Product Analytics.

### 🧪 Experiment Plan

Turns the next-best-action opportunity into a causal test.

### 🗺️ Product Roadmap

Prioritizes workflow improvements.

### 🤝 Stakeholder Readout

Communicates findings across Product, Sales, RevOps, Engineering, and leadership.

### 🛡️ Analytics QA Checklist

Documents validation and governance.

### 📌 Decision Log

Records assumptions, evidence, recommendations, and tradeoffs.

---

# 🛡️ Analytics Quality Standards

![Quality](https://img.shields.io/badge/ANALYTICS-QUALITY_FIRST-0F766E?style=for-the-badge)

* ✅ Stage definitions are explicit
* ✅ Opportunity state is separated from user behavior
* ✅ Weighted pipeline assumptions are documented
* ✅ Stale and overdue logic is reproducible
* ✅ Risk scoring remains transparent
* ✅ Heuristics are not mislabeled as machine learning
* ✅ Product metrics connect to business outcomes
* ✅ Primary experiment metrics include guardrails
* ✅ Revenue metrics are not used as the only definition of success
* ✅ Simulated data is clearly disclosed

---

# 🔐 Data & Modeling Transparency

![Transparency](https://img.shields.io/badge/DATA-SIMULATED_%26_DISCLOSED-0F766E?style=flat-square)
![Risk](https://img.shields.io/badge/RISK_SCORE-HEURISTIC_NOT_ML-DC2626?style=flat-square)
![Integrity](https://img.shields.io/badge/ANALYTICS-INTEGRITY_FIRST-111827?style=flat-square)

This portfolio project uses deterministic simulated Salesforce-style opportunity data.

The purpose is to model realistic CRM analytics and internal Product Analytics workflows without representing confidential company or customer information.

### Standards

**Simulated pipeline ≠ real company pipeline**

**Risk score ≠ machine-learning prediction**

**Weighted pipeline ≠ guaranteed revenue**

**Pipeline correlation ≠ causality**

**Workflow hypothesis ≠ validated product truth**

---

# 🏢 Stakeholder Value

<table>
<tr>
<td align="center"><b>🧑‍💼 PRODUCT</b><br>What workflow should improve?</td>
<td align="center"><b>💼 SALES</b><br>Which opportunity should I work next?</td>
<td align="center"><b>📈 REVOPS</b><br>Where is pipeline quality weakening?</td>
</tr>
<tr>
<td align="center"><b>💻 ENGINEERING</b><br>What behavior must be instrumented?</td>
<td align="center"><b>📊 ANALYTICS</b><br>Which patterns explain pipeline risk?</td>
<td align="center"><b>👔 LEADERSHIP</b><br>How healthy is forecast execution?</td>
</tr>
</table>

---

# 🏆 Skills Demonstrated

### ⚙️ Product Analytics

`Internal Products` • `Workflow Analytics` • `Product Funnels` • `Behavioral Metrics`

### ☁️ CRM / Salesforce

`Opportunity Analytics` • `Pipeline Health` • `Forecasting` • `CRM Data Quality`

### 📊 Analytics

`SQL` • `Python` • `Excel` • `Segmentation` • `KPI Design`

### ⚠️ Risk & Prioritization

`Aging` • `Stale Opportunities` • `Risk Heuristics` • `Priority Queues`

### 🧪 Experimentation

`Hypothesis Development` • `Product Metrics` • `Guardrails` • `Decision Rules`

### 📝 Product Management

`Requirements` • `Instrumentation` • `Roadmaps` • `Next-Best-Action`

### 💰 Business

`Weighted Pipeline` • `Revenue` • `Win Rate` • `Forecast Coverage` • `Executive Communication`

---

# 🎯 What This Project Proves

<table>
<tr>
<td align="center"><b>⚙️ ANALYZE</b><br>Understand internal workflows</td>
<td align="center"><b>⚠️ DIAGNOSE</b><br>Find pipeline risk</td>
<td align="center"><b>🎯 PRIORITIZE</b><br>Surface next-best actions</td>
</tr>
<tr>
<td align="center"><b>🧪 VALIDATE</b><br>Test workflow improvements</td>
<td align="center"><b>📈 MEASURE</b><br>Track progression</td>
<td align="center"><b>💰 CONNECT</b><br>Link behavior to revenue</td>
</tr>
</table>

---

<div align="center">

# ⚙️ Workflow → Action → Pipeline → Revenue

![Final](https://img.shields.io/badge/PRODUCT_ANALYTICS-USER_BEHAVIOR_%E2%86%92_WORKFLOW_%E2%86%92_PIPELINE_%E2%86%92_REVENUE-7C3AED?style=for-the-badge)

### ⚙️ Understand the workflow.

### ⚠️ Identify the risk.

### 🎯 Prioritize the next action.

### 🧪 Validate the product improvement.

### 💰 Measure the business outcome.

**Project 06 • Product Analyst Portfolio • Jamie Christian II**

</div>
