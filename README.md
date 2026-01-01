# FinTime – Customer Financial Behavior Analytics

> **End-to-End Business Intelligence Project for Churn, Revenue & Customer Health Analysis**

---

## 🔍 Project Overview

**FinTime** is a comprehensive **customer financial behavior analytics platform** designed to analyze transaction patterns, identify churn risk, measure revenue exposure, and deliver actionable business insights through interactive dashboards.

This project simulates a **real-world FinTech analytics use case**, following industry-standard workflows using **Python, SQL, and Power BI**.

---

## 🎯 Business Problem

Financial institutions often face challenges such as:

- Limited visibility into **customer-level transaction behavior**
- Delayed identification of **customer churn**
- Over-dependence on **high-value customers**
- Generic retention strategies with low effectiveness
- Lack of unified, decision-ready dashboards

As a result, organizations operate reactively, leading to revenue loss and poor customer retention.

---

## 💡 Solution Approach

FinTime addresses these challenges by:

- Analyzing **transactional behavior** at the customer level
- Identifying **active vs churned customers**
- Measuring **revenue at risk**
- Segmenting customers into **Premium, Standard, and Low Value**
- Providing **executive-ready Power BI dashboards**
- Delivering **clear, data-driven business recommendations**

---



## 🏗 Project Architecture & Workflow

Raw Transaction Data (CSV)  
↓  
Python (EDA & Data Cleaning)  
↓  
SQL (Business Logic & Aggregations)  
↓  
Derived Analytical Tables  
↓  
Power BI Dashboards  
↓  
Business Insights & Recommendations





---


## 📁 Folder Structure

```text
FinTime-Customer-Financial-Behavior-Analytics/
│
├── 01_Project_Documents/
│   ├── Problem_Statement.md
│   ├── Business_Requirements.md
│   ├── KPI_Definitions.md
│   └── Assumptions_and_Limitations.md
│
├── 02_Data/
│   ├── raw/
│   │   └── bank_transactions.csv
│   │
│   ├── cleaned_python/
│   │   └── transaction_final.csv
│   │
│   ├── analytical_sql/
│   │   ├── customer_summary.csv
│   │   ├── monthly_summary.csv
│   │   └── churn_table.csv
│   │
│   └── excel/
│       ├── data_dictionary.xlsx
│       ├── data_profiling.xlsx
│       └── data_quality_report.xlsx
│
├── 03_SQL/
│   ├── 01_data_loading.sql
│   ├── 02_data_cleaning.sql
│   ├── 03_feature_engineering.sql
│   ├── 04_customer_segmentation.sql
│   ├── 05_churn_logic.sql
│   └── 06_business_insights.sql
│
├── 04_Python/
│   └── notebooks/
│       ├── 01_Data_Understanding.ipynb
│       ├── 02_Data_Cleaning.ipynb
│       └── 03_Data_Insights.ipynb
│
├── 05_PowerBI/
│   ├── FinTime_Dashboard.pbix
│   └── Dashboard_Screenshots/
│       ├── Executive_Overview.png
│       ├── Customer_Segmentation.png
│       ├── Churn_and_Customer_Health.png
│       └── Insights_and_Recommendations.png
│
├── 06_Insights/
│   ├── Executive_Summary.md
│   ├── Key_Insights.md
│   ├── Business_Impact.md
│   └── Recommendations.md
│
├── README.md
└── LICENSE
```




---

## 📊 Dataset Overview

- **Type:** Transactional Financial Data  
- **Time Period:** 2016  
- **Granularity:** Transaction-level  
- **Key Fields:**
  - CustomerID
  - TransactionDate
  - TransactionAmount
  - TransactionTime
  - Location
  - Segment

> ⚠️ Dataset is synthetic and used strictly for analytical demonstration purposes.

---

## 🧹 Data Cleaning & Feature Engineering

Performed using **Python and SQL**:

- Date standardization and parsing
- Missing value handling
- Outlier removal using IQR method
- Transaction time → Hour extraction
- Monthly aggregation
- Customer-level aggregation
- Customer segmentation
- Churn flag creation (90-day inactivity rule)

---

## 🔁 Churn Definition

A customer is considered **churned** if no transaction is recorded in the last **90 days** from the dataset’s latest date.

**Why 90 days?**
- Industry-standard inactivity window
- Enables early churn detection
- Suitable for behavioral analysis

---

## 📐 Key KPIs Designed

| KPI | Description |
|----|-------------|
| Total Customers | Count of unique customers |
| Total Revenue | Sum of transaction amounts |
| Active Customers | Customers active in last 90 days |
| Churned Customers | Customers inactive for >90 days |
| Churn Rate (%) | Churned / Total Customers |
| Avg Transaction Value | Revenue / Transactions |
| Revenue at Risk | Revenue from churned customers |
| Customer Segments | Premium / Standard / Low Value |

---

## 📊 Power BI Dashboard Pages

### 🔹 Page 1: Executive Overview
- Total Revenue
- Total Customers
- Average Transaction Value
- Churn Rate %
- Monthly Revenue Trend
- Revenue Contribution by Segment
- Customer Distribution by Segment

---

### 🔹 Page 2: Customer Segmentation & Behavior
- Segment-wise Customer Count
- Revenue by Location
- Transaction Volume by Segment
- Avg Transaction Value by Segment
- Monthly Spend Trend

---

### 🔹 Page 3: Churn & Customer Health
- Active vs Churned Customers
- Churn Rate by Segment
- Churned Customers by Month
- Segment-wise Churn Breakdown
- Revenue Impact of Churn

---

### 🔹 Page 4: Insights & Recommendations
- Revenue at Risk by Segment
- Revenue Loss Contribution
- High-Risk Customer Table
- Key Business Insights
- Strategic Business Recommendations

---

## 🔍 Key Insights

- Premium customers contribute the highest share of revenue but pose significant churn risk
- Standard segment shows the highest churn probability
- Revenue exhibits clear seasonal patterns
- Peak transaction activity occurs between **6 PM – 9 PM**
- Metro cities dominate revenue contribution
- High revenue exposure exists due to churned customers

---

## 🚀 Business Recommendations

- Introduce loyalty and rewards programs for Premium customers
- Deploy targeted retention campaigns for Standard customers
- Run promotions during peak transaction hours
- Focus marketing efforts on high-performing locations
- Align offers with seasonal demand trends
- Implement ML-based churn prediction (future scope)

---

## 📈 Business Impact

- **15–20% potential churn reduction**
- **18–25% revenue uplift**
- Improved campaign targeting
- Reduced revenue volatility
- Enhanced executive decision-making

---

## ⚠️ Assumptions & Limitations

- Churn logic is rule-based (no ML prediction)
- No demographic or income-level data available
- No product-level transaction details
- Dataset is synthetic

---

## 🔮 Future Enhancements

- Predictive churn modeling
- Customer Lifetime Value forecasting
- Product recommendation engine
- Real-time data pipelines
- Automated alerts & dashboards

---

## 🛠️ Tech Stack

- **Python** – Data cleaning & EDA  
- **SQL (PostgreSQL)** – Business logic & transformations  
- **Power BI** – Visualization & dashboarding  
- **GitHub** – Version control & documentation  

---

## 👤 Author

**Ujjwal Verma**  
Data Analyst 

---
