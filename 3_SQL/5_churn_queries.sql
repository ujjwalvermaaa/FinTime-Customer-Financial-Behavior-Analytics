/*
File Name  : 5_churn_queries.sql
Author     : Ujjwal Verma

Objective: Identify churned and active customers based on transaction inactivity
to support retention analysis, KPI reporting, and dashboard insights.
    

Context: In the absence of an explicit churn flag, customer churn is inferred 
from behavioral inactivity. Customers who have not performed any transaction 
within a defined time window are considered churned.
    

Churn Definition:  - A customer is marked as 'Churned' if no transactions have occurred
     				 in the last 90 days from the current date.
   				   - Otherwise, the customer is classified as 'Active'.
   

Output:  churn_table – One record per customer containing churn status derived
   					   from transaction behavior.
*/

-- Create a customer-level churn table based on last transaction activity


CREATE TABLE churn_table AS
WITH max_date AS (
    SELECT MAX(transactiondate::DATE) AS dataset_last_date
    FROM transactions_cleaned
)
SELECT
    t.customerid,
    MAX(t.transactiondate::DATE) AS lasttransactiondate,
    CASE
        WHEN MAX(t.transactiondate::DATE)
             < (SELECT dataset_last_date FROM max_date) - INTERVAL '90 days'
        THEN 'Churned'
        ELSE 'Active'
    END AS churnstatus
FROM transactions_cleaned t
GROUP BY t.customerid;

