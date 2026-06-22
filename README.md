# 🏡 HM Land Registry – Intelligent Housing Market Analytics & Valuation Tracker

## 📌 Tech Stack

🐍 Python (pandas) | 🧮 SQL (PostgreSQL / SQL Server) | 📊 Power BI (Power Query, DAX)

---

# 📊 Project Overview

End-to-end data analytics system for UK housing market analysis.
Focus: property valuation trends, market volatility, and demand patterns using ETL, SQL analytics, and interactive dashboards.

---

# 🧠 Phase 1: Python Data Engineering

## 🔄 Data Ingestion & Cleaning

* Loaded `hm_land_registry_2000.csv`
* Standardised `Transaction_Date` to datetime
* Enforced numeric data types for pricing fields

---

## ⚠️ Intelligent Data Filtering

Detected and quarantined invalid records:

* ❌ Sold_Price < 20% of Asking_Price
* ❌ Negative Days_on_Market

📁 Output: `quarantined_transactions.csv`

---

## 🏷 Market Status Recalculation

Corrected inconsistent status values:

* 🔴 > 120 days → Stagnant
* 🟢 < 14 days → High Demand
* 🟡 Otherwise → Normal

---

## ⚙️ Feature Engineering

* 📈 Price_Variance_Percent
  `((Sold_Price - Asking_Price) / Asking_Price) * 100`

* 🏘 Valuation_Band (based on regional quartiles)

  * Entry-Level
  * Mid-Market
  * Premium
  * Ultra-Premium

---

# 🗄 Phase 2: SQL Analytics

## 🏗 Database Design

* Loaded cleaned dataset into a single table:
  📊 `Housing_Transactions_Master`
* Flat architecture used for simplified analytics

---

## 📉 Market Trend Smoothing (Window Function)

* 30-day moving average of Sold_Price
* Partitioned by UK Region
* Ordered by transaction date

---

## 📊 Regional Volatility Ranking

* Calculated average Price_Variance_Percent
* Ranked regions using ORDER BY DESC
* Identified bidding intensity hotspots

---

# 📊 Phase 3: Power BI Dashboard

## 📌 Data Modeling

* Imported `Housing_Transactions_Master` via Power Query
* Created Calendar/Date table (DAX) for time intelligence

---

## 📈 Market Trend Hub

* Line charts: Average Sold Price over time
* Slicers:

  * Region
  * Property Type
* Map visual: UK sales intensity by region

---

## 🧠 Smart Narrative (DAX)

Dynamic insights such as:
👉 “Region shows strong growth with increasing High Demand properties.”

Includes:

* Market status blending
* Percentage growth interpretation

---

## 🚨 KPI Alerts

* Days_on_Market > 90 → 🔴 Critical alert
* Conditional formatting applied to KPI cards

---

## 🎚 What-If Analysis

* Interest Rate Shock slider (1%–5%)
* “Projected Buyer Drop-off” measure
* Simulates affordability impact on housing demand

---

# 🎯 Outcomes

✔ Clean ETL pipeline for housing data
✔ Market anomaly detection system
✔ Regional price volatility analysis
✔ Advanced SQL analytics with window functions
✔ Interactive BI dashboard with predictive simulation
✔ Real-world housing intelligence insights
