/*
File Name  : 7_advanced_analysis.sql
Author     : Ujjwal Verma

Objective: Perform advanced analytical queries to extract business insights
related to revenue performance, customer behavior, churn risk, and customer 
lifetime value.
 

Context: This file contains exploratory and analytical SQL queries that go beyond 
basic KPIs. These queries are used to answer specific business questions and 
support dashboard storytelling, executive insights, and strategic recommendations.
    

Note: The queries in this file are primarily read-only and analytical. They do not 
modify source tables (except for the creation of a view). 
*/

---------------------------------------------------------------------
-- 1. Total Revenue & Key Spending Metrics
-- Purpose: Measure overall financial performance and activity level
---------------------------------------------------------------------
SELECT
    SUM(transactionamountinr) AS total_revenue,
    AVG(transactionamountinr) AS average_transaction_value,
    COUNT(*)                  AS total_transactions
FROM transactions_cleaned;


----------------------------------------------------------------------
-- 2. Top 10 Highest Revenue Customer Locations
-- Purpose: Identify geographic regions contributing the most revenue
----------------------------------------------------------------------
SELECT
    custlocation,
    SUM(totalamountspent) AS revenue
FROM customer_summary
GROUP BY custlocation
ORDER BY revenue DESC
LIMIT 10;


-------------------------------------------------------------------
-- 3. Revenue Contribution by Customer Segment
-- Purpose: Understand revenue concentration across value segments
-------------------------------------------------------------------
WITH segment_revenue AS (
    SELECT
        segment,
        SUM(totalamountspent) AS revenue
    FROM customer_summary
    GROUP BY segment
)
SELECT
    segment,
    revenue
FROM segment_revenue
ORDER BY revenue DESC;


------------------------------------------------------------
-- 4. Month-over-Month Revenue Trend & Growth Percentage
-- Purpose: Analyze revenue growth patterns and seasonality
------------------------------------------------------------

WITH monthly_totals AS (
    SELECT
        month,
        SUM(monthlyspend) AS total_revenue
    FROM monthly_summary
    GROUP BY month
)
SELECT
    month,
    total_revenue,
    LAG(total_revenue) OVER (ORDER BY month) AS previous_month_revenue,
    ROUND(
        (
            (total_revenue - LAG(total_revenue) OVER (ORDER BY month))
            / NULLIF(LAG(total_revenue) OVER (ORDER BY month), 0)
        )::NUMERIC * 100,
        2
    ) AS revenue_growth_percent
FROM monthly_totals
ORDER BY month;



--------------------------------------------------------------------
-- 5. Peak Transaction Hour by Total Spending
-- Purpose: Identify the time window with highest customer activity
--------------------------------------------------------------------
SELECT
    transactionhour,
    SUM(transactionamountinr) AS total_spend
FROM transactions_cleaned
GROUP BY transactionhour
ORDER BY total_spend DESC;


--------------------------------------------------------------
-- 6. Churn Rate by Customer Segment
-- Purpose: Compare churn risk across customer value segments
--------------------------------------------------------------
WITH churn_data AS (
    SELECT
        cs.segment,
        ct.churnstatus
    FROM customer_summary cs
    JOIN churn_table ct
        ON cs.customerid = ct.customerid
)
SELECT
    segment,
    SUM(CASE WHEN churnstatus = 'Churned' THEN 1 ELSE 0 END) AS churned_customers,
    COUNT(*)                                               AS total_customers,
    ROUND(
        SUM(CASE WHEN churnstatus = 'Churned' THEN 1 ELSE 0 END) * 100.0
        / COUNT(*),
        2
    ) AS churn_rate_percent
FROM churn_data
GROUP BY segment
ORDER BY churn_rate_percent DESC;


-------------------------------------------------------------------
-- 7. Customer Lifetime Value (CLV) View
-- Purpose: Provide a reusable customer-level profitability metric
-------------------------------------------------------------------
CREATE OR REPLACE VIEW customer_lifetime_value AS
SELECT
    customerid,
    segment,
    totalamountspent,
    avgtransactionvalue,
    totaltransactions,
    (avgtransactionvalue * totaltransactions) AS clv
FROM customer_summary;
