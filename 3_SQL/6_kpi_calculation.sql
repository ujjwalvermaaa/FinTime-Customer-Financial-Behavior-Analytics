/*
File Name  : 6_kpi_calculation.sql
Author     : Ujjwal Verma

Objective:  Compute core business KPIs required for executive reporting,
performance monitoring, and Power BI dashboard visualization.
   

Context: These KPIs represent high-level business metrics derived from
transactional, customer, and churn datasets. They are used to evaluate 
overall financial performance, customer base size, spending behavior, 
retention health, and segment-wise contribution.
    

Usage:  The results of these queries are consumed directly in dashboards
and summary reports to support decision-making by business stakeholders.
*/

-- KPI 1: Total number of unique customers
SELECT
    COUNT(DISTINCT CustomerID) AS TotalCustomers
FROM transactions_cleaned;


-- KPI 2: Total revenue generated across all transactions
SELECT
    SUM(TransactionAmountINR) AS TotalRevenue
FROM transactions_cleaned;


-- KPI 3: Average transaction amount (spending per transaction)
SELECT
    AVG(TransactionAmountINR) AS AvgTransactionAmount
FROM transactions_cleaned;


-- KPI 4: Customer churn distribution
-- Provides count of active vs churned customers
SELECT
    ChurnStatus,
    COUNT(*) AS CustomerCount
FROM churn_table
GROUP BY ChurnStatus;


-- KPI 5: Revenue contribution by customer segment
-- Used to understand revenue concentration across value segments
SELECT
    Segment,
    SUM(TotalAmountSpent) AS SegmentRevenue
FROM customer_summary
GROUP BY Segment;
