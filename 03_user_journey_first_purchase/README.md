<div align="center">

# 🧭 User Journey to First Purchase

## Behavioral Analytics • Time-to-Value • Acquisition Quality • Experimentation

![Project](https://img.shields.io/badge/PROJECT_03-USER_JOURNEY-2563EB?style=for-the-badge)
![Status](https://img.shields.io/badge/STATUS-PORTFOLIO_READY-16A34A?style=for-the-badge)
![Focus](https://img.shields.io/badge/FOCUS-FIRST_PURCHASE_JOURNEY-7C3AED?style=for-the-badge)

<br>

![SQL](https://img.shields.io/badge/SQL-JOURNEY_ANALYSIS-336791?style=flat-square\&logo=postgresql\&logoColor=white)
![Python](https://img.shields.io/badge/PYTHON-STATISTICAL_ANALYSIS-3776AB?style=flat-square\&logo=python\&logoColor=white)
![Excel](https://img.shields.io/badge/EXCEL-DECISION_MODEL-217346?style=flat-square\&logo=microsoftexcel\&logoColor=white)
![Statistics](https://img.shields.io/badge/STATS-BOOTSTRAP_%26_NONPARAMETRIC-9333EA?style=flat-square)
![Experimentation](https://img.shields.io/badge/EXPERIMENT-POWER_PLANNING-F59E0B?style=flat-square)

### 💡 *Understanding how users move from first touch to first purchase — and where the journey becomes unnecessarily difficult.*

</div>

---

# 🚦 Executive Snapshot

|                               |                                                     |
| ----------------------------- | --------------------------------------------------- |
| 🎯 **Product Problem**        | Friction between acquisition and first purchase     |
| 🧭 **Journey Focus**          | First Touch → Exploration → Intent → First Purchase |
| ⏱️ **Primary Behavioral KPI** | Journey Duration / Time-to-First-Purchase           |
| 🔁 **Journey Depth**          | Sessions and Events Before Purchase                 |
| 📣 **Acquisition Lens**       | First Acquisition Medium                            |
| 📱 **Experience Lens**        | Device Type                                         |
| 📊 **Validation**             | Bootstrap CI • Kruskal-Wallis • Spearman            |
| 🧪 **Decision Method**        | Controlled Experiment + Power Planning              |
| 🧰 **Core Tools**             | SQL • Python • Excel                                |

---

# 🧠 Product Analytics Mission

This project investigates a critical growth and product question:

> **What causes some users to reach their first purchase quickly while others require more sessions, more interactions, and more time?**

The analysis connects:

**📣 Acquisition → 👀 Exploration → 🔁 Repeat Visits → 🎯 Purchase Intent → 💳 First Purchase**

The goal is not simply to report the number of sessions before purchase.

The objective is to determine:

* Which users experience the longest journeys
* Which acquisition sources produce better journey quality
* Whether device experience contributes to friction
* Which behavioral signals are associated with faster conversion
* Which opportunities should Product prioritize
* How those opportunities should be tested

---

# 🧭 The First-Purchase Journey

<div align="center">

## 📣 FIRST TOUCH

### ↓

## 👀 PRODUCT EXPLORATION

### ↓

## 🔁 RETURN / CONTINUED ENGAGEMENT

### ↓

## 🎯 PURCHASE INTENT

### ↓

## 💳 FIRST PURCHASE

</div>

A customer's first purchase is not a single event.

It is the outcome of a sequence of interactions.

That sequence can reveal:

**Friction • Confidence • Intent • Acquisition Quality • Experience Quality**

---

# 🏆 Journey Analytics Framework

![Framework](https://img.shields.io/badge/FRAMEWORK-TOUCH_%E2%86%92_BEHAVIOR_%E2%86%92_FRICTION_%E2%86%92_PURCHASE-7C3AED?style=for-the-badge)

This project evaluates the first-purchase journey through five connected lenses:

### 1. 🧭 Journey Length

How much effort is required before purchase?

### 2. ⏱️ Journey Speed

How long does it take users to convert?

### 3. 📣 Acquisition Quality

Which sources produce smoother journeys?

### 4. 📱 Experience Quality

Does device type affect purchase friction?

### 5. 💰 Purchase Quality

Does faster conversion maintain healthy first-purchase value?

---

# 📊 Executive KPI Framework

## 🔁 Sessions Before Purchase

Measures how many sessions are required before a user completes the first purchase.

### Product Question

> **How many visits does a customer need before reaching value?**

A high number may indicate:

* Consideration complexity
* Lack of confidence
* Poor journey continuity
* Weak product information
* Checkout hesitation

---

## 🖱️ Events Before Purchase

Measures behavioral effort before conversion.

### Product Question

> **How much interaction is required before a user is ready to buy?**

More events are not automatically good.

High event counts may indicate:

✅ Healthy exploration

or

⚠️ Excessive effort and friction

Context matters.

---

## ⏱️ Journey Duration

Measures elapsed time from first touch to first purchase.

### Product Question

> **How long does it take a user to reach first transaction value?**

Journey duration acts as a key **time-to-value** indicator.

---

## ⚡ Purchase Within 7 Days

Measures the proportion of users completing the first purchase within a faster journey window.

### Product Question

> **What percentage of users reach transaction value quickly?**

---

## 💵 First Purchase Revenue

Measures financial quality of the first transaction.

### Product Question

> **Does a faster journey preserve healthy order value?**

This prevents the analysis from optimizing speed while accidentally harming purchase quality.

---

# 🔬 Analytical Framework

The project follows eight analytical layers.

---

## 1️⃣ Journey Baseline

![Layer](https://img.shields.io/badge/LAYER_01-JOURNEY_BASELINE-2563EB?style=flat-square)

Establish:

* Average sessions before purchase
* Average events before purchase
* Median journey duration
* Purchase-within-7-days rate
* Average first-purchase revenue

### Question

> **What does the typical journey look like?**

---

## 2️⃣ Acquisition Quality

![Layer](https://img.shields.io/badge/LAYER_02-ACQUISITION_QUALITY-059669?style=flat-square)

Analyze journey behavior by first acquisition medium.

Potential dimensions:

**Organic Search • Paid Search • Email • Referral • Social • Direct**

### Question

> **Which channels bring users who move efficiently toward purchase?**

Acquisition quality should not be judged only by traffic volume.

A better framework is:

**Acquisition → Journey Quality → Purchase → Revenue**

---

## 3️⃣ Device Friction

![Layer](https://img.shields.io/badge/LAYER_03-DEVICE_FRICTION-F59E0B?style=flat-square)

Compare:

📱 Mobile
💻 Desktop
📟 Tablet

Across:

* Journey duration
* Session count
* Event count
* Fast-purchase rate
* Revenue

### Question

> **Does the purchase journey become harder on certain devices?**

---

## 4️⃣ Behavioral Segmentation

![Layer](https://img.shields.io/badge/LAYER_04-BEHAVIORAL_SEGMENTS-7C3AED?style=flat-square)

Journey segments help distinguish different customer paths.

Examples:

### 🆕 New Consumer

Users entering the product journey with limited prior behavior.

### 🔁 Returning Browser

Users requiring repeat sessions before purchase.

### 🎯 High Intent

Users moving efficiently toward first purchase.

### 🏷️ Deal Seeker

Users exhibiting longer consideration behavior before conversion.

### Question

> **Do different users require different product interventions?**

---

## 5️⃣ Statistical Validation

![Layer](https://img.shields.io/badge/LAYER_05-STATISTICAL_VALIDATION-9333EA?style=flat-square)

Descriptive differences can be misleading.

This project uses statistical methods to evaluate whether observed patterns are meaningful.

Methods include:

* Bootstrap confidence intervals
* Kruskal-Wallis tests
* Spearman rank correlation

### Question

> **Is the observed difference large and consistent enough to take seriously?**

---

## 6️⃣ Cohort Analysis

![Layer](https://img.shields.io/badge/LAYER_06-COHORT_ANALYSIS-0891B2?style=flat-square)

Group users by first-touch period to examine whether journey quality changes over time.

### Question

> **Are newer acquisition cohorts reaching first purchase more efficiently?**

Cohort analysis prevents aggregate averages from hiding temporal changes.

---

## 7️⃣ Opportunity Prioritization

![Layer](https://img.shields.io/badge/LAYER_07-PRIORITIZATION-DC2626?style=flat-square)

Evaluate opportunities based on:

**Reach • Impact • Confidence • Effort**

### Question

> **Which journey problem should Product address first?**

---

## 8️⃣ Experiment Planning

![Layer](https://img.shields.io/badge/LAYER_08-EXPERIMENTATION-111827?style=flat-square)

Move from observational insight to causal validation.

### Question

> **Will the proposed journey improvement actually cause better outcomes?**

---

# 🔎 Key Behavioral Relationship

![Insight](https://img.shields.io/badge/KEY_INSIGHT-JOURNEY_COMPLEXITY_%E2%86%94_TIME-7C3AED?style=for-the-badge)

The project evaluates the relationship between:

**Sessions Before Purchase**

and

**Journey Duration**

using **Spearman rank correlation**.

This helps test whether deeper journeys are generally associated with longer time-to-purchase.

### Important

> **Correlation describes association — not causality.**

A strong relationship may indicate journey friction, but it does not prove that reducing sessions alone will cause faster purchases.

---

# 📐 Statistical Validation

## 🥾 Bootstrap Confidence Intervals

![Stats](https://img.shields.io/badge/METHOD-BOOTSTRAP_CONFIDENCE_INTERVALS-9333EA?style=flat-square)

Bootstrap resampling estimates uncertainty around key metrics without relying heavily on strict distribution assumptions.

Useful for:

* Journey duration
* Sessions before purchase
* Fast-purchase rates
* Revenue measures

### Product Value

Instead of saying:

> “The average is X.”

the analysis can ask:

> **“How uncertain is that estimate?”**

---

# 🧪 Kruskal-Wallis Testing

![Stats](https://img.shields.io/badge/METHOD-KRUSKAL_WALLIS-7C3AED?style=flat-square)

Used to evaluate whether journey-duration distributions differ across groups such as:

* Acquisition medium
* Device type

This nonparametric approach is useful when journey-duration data may not satisfy normality assumptions.

### Product Question

> **Are differences across segments likely to represent more than random variation?**

---

# 🔗 Spearman Correlation

![Stats](https://img.shields.io/badge/METHOD-SPEARMAN_CORRELATION-0891B2?style=flat-square)

Used to measure monotonic association between journey variables.

Example:

**Sessions Before Purchase ↔ Journey Duration**

### Why Spearman?

Journey metrics may be:

* Skewed
* Non-normal
* Influenced by outliers

Spearman provides a rank-based relationship measure.

---

# 🔥 Friction Index

![Friction](https://img.shields.io/badge/MODEL-JOURNEY_FRICTION_INDEX-DC2626?style=for-the-badge)

A friction index combines multiple journey dimensions into one prioritization lens.

Potential components:

* Journey duration
* Sessions before purchase
* Events before purchase
* Fast-purchase rate
* Relative segment performance

### Purpose

The friction index is not intended to replace individual metrics.

It helps answer:

> **Where should investigation begin?**

---

# 🎯 Priority Matrix

![Priority](https://img.shields.io/badge/PRIORITY-MEDIUM_%C3%97_DEVICE-DC2626?style=for-the-badge)

Analyzing **Acquisition Medium × Device** reveals intersectional friction that single-dimension segmentation can miss.

Example:

A channel may look healthy overall.

A device may look healthy overall.

But a specific **channel × device** combination may perform poorly.

### Product Principle

> **Aggregate averages can hide actionable user experiences.**

---

# 💡 Product Recommendation

## 🥇 Priority — Improve Journey Continuity

The core product opportunity is to reduce unnecessary friction between user sessions without forcing artificial speed.

Potential treatments include:

### 🧭 Persistent Journey State

Preserve recently viewed products, selections, or intent across sessions.

### 🔔 Contextual Return Messaging

Help returning users resume where they left off.

### 📱 Device-Specific Experience Improvements

Address device segments with disproportionately long journeys.

### 🚚 Purchase Confidence

Surface shipping, availability, returns, and delivery expectations earlier.

### 💳 Checkout Readiness

Reduce repeated information gathering immediately before purchase.

---

# 🚨 Product Principle

The objective is **not**:

> “Make everybody purchase faster at any cost.”

The objective is:

> **Reduce unnecessary friction while preserving healthy customer and business outcomes.**

---

# 🧪 Product Experiment

![Experiment](https://img.shields.io/badge/EXPERIMENT-JOURNEY_CONTINUITY-7C3AED?style=for-the-badge)

## Hypothesis

> Improving journey continuity for high-friction users will increase the percentage of customers reaching first purchase within seven days without materially reducing first-purchase revenue.

### 🅰️ Control

Current user journey.

### 🅱️ Treatment

Enhanced continuity experience using:

* Persistent recent activity
* Resume-journey prompts
* Clear next action
* Purchase-confidence information
* Reduced repeat navigation

---

# 📏 Experiment Measurement

## 🎯 Primary Metric

**Purchase Within 7 Days**

---

## 📊 Secondary Metrics

* Journey duration
* Sessions before purchase
* Overall first-purchase conversion
* Events before purchase

---

## 💰 Business Metric

**First Purchase Revenue**

---

## 🛡️ Guardrails

* Refund rate
* Cancellation behavior
* Support contacts
* Error rate
* Page / app performance
* Average first-purchase value

---

# ⚡ Experiment Power Planning

![Power](https://img.shields.io/badge/EXPERIMENT-POWER_PLANNING-F59E0B?style=for-the-badge)

A professional experiment should estimate sample requirements **before** launch.

Inputs include:

* Baseline conversion
* Minimum detectable effect
* Significance level
* Statistical power

### Example Framework

**Baseline 7-Day Purchase Rate**

→ observed starting point

**Target Relative Lift**

→ minimum worthwhile improvement

**Alpha**

→ false-positive tolerance

**Power**

→ probability of detecting the intended effect

### Product Principle

> **A test without sufficient sample size may create false confidence.**

---

# 🧮 RICE Prioritization

![RICE](https://img.shields.io/badge/PRIORITIZATION-RICE-DC2626?style=for-the-badge)

Opportunities are evaluated using:

### 👥 Reach

How many users are affected?

### 📈 Impact

How strongly could the change improve user or business outcomes?

### 🎯 Confidence

How strong is the supporting evidence?

### 🛠️ Effort

What level of product/design/engineering work is required?

### Formula

```text
RICE Score
=
(Reach × Impact × Confidence) ÷ Effort
```

RICE supports prioritization.

It does not replace judgment.

---

# 🧠 Product Decision Framework

![Decision](https://img.shields.io/badge/DECISION-JOURNEY_%E2%86%92_EVIDENCE_%E2%86%92_ACTION-7C3AED?style=for-the-badge)

Every major journey insight follows:

### 🔍 Observation

What behavior occurred?

### 📊 Evidence

Which journey metric supports the finding?

### 📐 Validation

How certain are we about the pattern?

### 🧠 Hypothesis

What may explain the friction?

### 💡 Recommendation

What should Product change?

### 🎯 Priority

Why is this worth solving?

### 🧪 Experiment

How will causality be tested?

### 📏 Success Metric

What determines improvement?

### 🛡️ Guardrail

What must remain healthy?

### 💰 Business Outcome

Does the change preserve purchase quality?

### ✅ Decision

Ship • Iterate • Stop • Investigate

---

# 💾 SQL Journey Analytics

![SQL](https://img.shields.io/badge/SQL-JOURNEY_ANALYTICS-336791?style=for-the-badge\&logo=postgresql\&logoColor=white)

SQL supports:

* Journey baseline metrics
* Acquisition-medium analysis
* Device segmentation
* Journey-segment analysis
* First-touch cohorts
* Medium × device analysis
* Outlier / data-integrity audits
* Opportunity prioritization

### Analytical Principle

> **A journey metric should preserve the customer sequence it is intended to represent.**

---

# 🐍 Python Statistical Analytics

![Python](https://img.shields.io/badge/PYTHON-STATS_%26_EXPERIMENTATION-3776AB?style=for-the-badge\&logo=python\&logoColor=white)

Python supports:

* Behavioral segmentation
* Correlation analysis
* Bootstrap confidence intervals
* Nonparametric statistical testing
* Cohort analysis
* Experiment sample-size planning
* Friction scoring
* Reproducible outputs

The focus is:

**Statistical reasoning + product interpretation**

rather than decorative visualization.

---

# 📗 Excel Journey Decision Center

![Excel](https://img.shields.io/badge/EXCEL-JOURNEY_DECISION_CENTER-217346?style=for-the-badge\&logo=microsoftexcel\&logoColor=white)

The stakeholder-facing workbook includes:

* Executive Dashboard
* Medium Analysis
* Device Analysis
* Journey Segments
* Session Friction
* Cohorts
* Priority Matrix
* Statistical Results
* Opportunity Sizing
* Experiment Sizing
* RICE Backlog
* Metric Dictionary
* Experiment Plan
* Decision Log

Excel functions as a **Product Decision Center**, not simply a spreadsheet output.

---

# 🗂️ Project Structure

```text
03_user_journey_first_purchase/
│
├── 📁 data/
│   └── first_purchase_journey.csv
│
├── 📁 sql/
│   └── journey_analysis.sql
│
├── 📁 python/
│   ├── main.py
│   └── requirements.txt
│
├── 📁 excel/
│   └── user_journey_first_purchase_corporate_10_10.xlsx
│
├── 📁 outputs/
│   └── analytical CSV outputs
│
├── 📁 docs/
│   ├── executive_summary.md
│   ├── metric_dictionary.md
│   ├── data_dictionary.md
│   ├── experiment_plan.md
│   ├── instrumentation_plan.md
│   ├── product_requirements_brief.md
│   ├── stakeholder_readout.md
│   ├── analytics_qa_checklist.md
│   └── decision_log.md
│
└── 📄 README.md
```

---

# 📚 Documentation

![Docs](https://img.shields.io/badge/DOCUMENTATION-PRODUCT_DECISION_READY-0F766E?style=for-the-badge)

### 📄 Executive Summary

Translates journey analysis into a concise product recommendation.

### 📐 Metric Dictionary

Defines journey metrics and denominators.

### 🗃️ Data Dictionary

Documents analytical fields and data grain.

### 🧪 Experiment Plan

Converts the journey opportunity into a testable product hypothesis.

### 📡 Instrumentation Plan

Defines the events required to measure the journey reliably.

### 📝 Product Requirements Brief

Translates evidence into product requirements.

### 🤝 Stakeholder Readout

Frames results for Product, Design, Growth, and leadership.

### 🛡️ Analytics QA

Documents analytical and data-quality checks.

### 📌 Decision Log

Records evidence, assumptions, tradeoffs, and final decisions.

---

# 📡 Product Instrumentation

![Tracking](https://img.shields.io/badge/PRODUCT-INSTRUMENTATION-0891B2?style=for-the-badge)

A journey cannot be improved reliably if it cannot be measured reliably.

Instrumentation should capture:

* First touch
* Product views
* Return sessions
* High-intent behavior
* Checkout initiation
* Purchase completion
* Device context
* Acquisition source
* Journey timestamps

### Principle

> **Measurement design is part of product design.**

---

# 🛡️ Analytics Quality Standards

![Quality](https://img.shields.io/badge/ANALYTICS-QUALITY_FIRST-0F766E?style=for-the-badge)

* ✅ Journey metrics are explicitly defined
* ✅ Median is used where skew may affect averages
* ✅ Segment differences receive statistical validation
* ✅ Confidence intervals communicate uncertainty
* ✅ Correlation is separated from causality
* ✅ Cohorts are used to avoid misleading aggregate trends
* ✅ Experiment sample size is estimated before launch
* ✅ Primary metrics include guardrails
* ✅ Revenue quality is protected
* ✅ Simulated data is clearly disclosed
* ✅ Product recommendations connect to measurable behaviors

---

# 🔐 Data Transparency

![Transparency](https://img.shields.io/badge/DATA-SIMULATED_%26_DISCLOSED-0F766E?style=flat-square)
![Integrity](https://img.shields.io/badge/ANALYTICS-INTEGRITY_FIRST-111827?style=flat-square)

This portfolio project uses deterministic simulated journey data for analytical demonstration.

The purpose is to reproduce realistic Product Analytics workflows without presenting confidential customer or company information.

### Standards

**Simulated behavior ≠ real company behavior**

**Correlation ≠ causation**

**Statistical significance ≠ business significance**

**Friction score ≠ causal model**

**Scenario impact ≠ guaranteed outcome**

---

# 🏢 Stakeholder Value

<table>
<tr>
<td align="center"><b>🧑‍💼 PRODUCT</b><br>Where should journey friction be reduced?</td>
<td align="center"><b>🎨 DESIGN</b><br>Where is the experience difficult?</td>
<td align="center"><b>💻 ENGINEERING</b><br>What journey events must be tracked?</td>
</tr>
<tr>
<td align="center"><b>📊 ANALYTICS</b><br>Are differences statistically credible?</td>
<td align="center"><b>📈 GROWTH</b><br>Which channels produce quality journeys?</td>
<td align="center"><b>💼 LEADERSHIP</b><br>What is the business opportunity?</td>
</tr>
</table>

---

# 🏆 Skills Demonstrated

### 📊 Analytics

`SQL` • `Python` • `Excel` • `Segmentation` • `Cohort Analysis`

### 📐 Statistics

`Bootstrap Confidence Intervals` • `Kruskal-Wallis` • `Spearman Correlation`

### 🧭 Product Analytics

`User Journey Analysis` • `Time-to-Value` • `Behavioral Segmentation` • `Acquisition Quality` • `Journey Friction`

### 🧪 Experimentation

`Hypothesis Development` • `Sample-Size Planning` • `Primary Metrics` • `Guardrails` • `Decision Rules`

### 🎯 Product

`RICE Prioritization` • `Instrumentation` • `Requirements` • `Opportunity Sizing`

### 💼 Business

`First-Purchase Revenue` • `Executive Communication` • `Stakeholder Readouts` • `Decision Support`

---

# 🎯 What This Project Proves

<table>
<tr>
<td align="center"><b>🧭 MAP</b><br>Understand the journey</td>
<td align="center"><b>⏱️ MEASURE</b><br>Quantify time-to-value</td>
<td align="center"><b>🔍 DIAGNOSE</b><br>Find friction</td>
</tr>
<tr>
<td align="center"><b>📐 VALIDATE</b><br>Test statistical evidence</td>
<td align="center"><b>🎯 PRIORITIZE</b><br>Choose the right opportunity</td>
<td align="center"><b>🧪 EXPERIMENT</b><br>Validate causal impact</td>
</tr>
</table>

---

<div align="center">

# 🧭 First Touch → Journey → First Purchase

![Final](https://img.shields.io/badge/PRODUCT_ANALYTICS-BEHAVIOR_%E2%86%92_FRICTION_%E2%86%92_EVIDENCE_%E2%86%92_DECISION-7C3AED?style=for-the-badge)

### 🧭 Map the journey.

### ⏱️ Measure time-to-value.

### 📐 Validate the evidence.

### 🎯 Prioritize the friction.

### 🧪 Test the solution.

**Project 03 • Product Analyst Portfolio • Jamie Christian II**

</div>
