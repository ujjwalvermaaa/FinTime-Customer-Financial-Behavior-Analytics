/*
File Name  : 3_feature_engineering.sql
Author     : Ujjwal Verma

Objective: Create customer-level and time-based aggregated datasets from transactional data
to support segmentation, churn analysis, KPI calculation, and dashboard reporting.
    
    
Context: Raw transaction data exists at a granular level. For analytical and business
intelligence purposes, it is necessary to derive summarized views that capture customer 
behavior and spending patterns over time.
 

Outputs: 1. customer_summary  – One record per customer containing lifetime metrics.
         2. monthly_summary   – Customer-level monthly aggregation for trend analysis.
*/


-- Create a customer-level summary table aggregating transaction behavior
-- This table is used for customer segmentation, churn identification,
-- lifetime value analysis, and high-level KPI reporting.
CREATE TABLE customer_summary AS
SELECT
    CustomerID,
    MIN(CustomerDOB)           AS CustomerDOB,
    MIN(CustGender)            AS CustGender,
    MIN(CustLocation)          AS CustLocation,
    MAX(CustAccountBalance)    AS LatestAccountBalance,
    COUNT(*)                   AS TotalTransactions,
    SUM(TransactionAmountINR)  AS TotalAmountSpent,
    AVG(TransactionAmountINR)  AS AvgTransactionValue,
    MIN(TransactionDate)       AS FirstTransactionDate,
    MAX(TransactionDate)       AS LastTransactionDate
FROM transactions_cleaned
GROUP BY CustomerID;



-- Create a monthly-level summary table to analyze spending trends over time
-- This table enables month-over-month revenue analysis and seasonality insights.


CREATE TABLE monthly_summary AS
SELECT
    CustomerID,
    DATE_TRUNC('month', TransactionDate::DATE) AS Month,
    SUM(TransactionAmountINR) AS MonthlySpend,
    COUNT(*) AS MonthlyTxnCount
FROM transactions_cleaned
GROUP BY
    CustomerID,
    DATE_TRUNC('month', TransactionDate::DATE);

