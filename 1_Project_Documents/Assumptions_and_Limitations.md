# Assumptions & Limitations  
## FinTime – Customer Financial Behavior Analytics  

---

## Assumptions

1. **Churn Definition**  
   A customer is classified as *churned* if no transactions are recorded for more than **90 consecutive days** from the dataset’s latest transaction date.

2. **Behavior-Based Analysis**  
   Customer financial health and churn risk are derived solely from **transactional behavior** (recency, frequency, monetary value).

3. **Synthetic Dataset**  
   The dataset is a synthetic yet realistic representation created for analytical demonstration and does not reflect real customer identities.

4. **Transaction Validity**  
   All transaction amounts are assumed valid unless flagged and treated as anomalies during data preprocessing.

5. **Time Scope**  
   Analysis is limited to **calendar year 2016**, and all trends are interpreted within this timeframe.

---

## Limitations

1. **Lack of Demographics**  
   Absence of income, age, occupation, and household data limits deeper customer profiling.

2. **No Product-Level Data**  
   Transactions are not mapped to specific products (loans, cards, savings), restricting product-wise analysis.

3. **Rule-Based Churn Logic**  
   Churn detection is logic-driven and not predictive in nature.

4. **No Real-Time Analytics**  
   The project does not support live or streaming data ingestion.

5. **Dataset Dependency**  
   Insights are dependent on the accuracy and completeness of the provided dataset.
