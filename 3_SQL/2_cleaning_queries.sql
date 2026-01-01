/*
File Name  : 2_cleaning_queries.sql
Author     : Ujjwal Verma

Objective: Perform essential data quality checks and cleanup on the base transactions table
to ensure reliability and consistency for downstream analytical processing.
   

Context: Transactional datasets may contain duplicate records or incomplete entries due 
to ingestion issues or source system anomalies. These steps enforce data integrity by 
removing duplicate transactions and eliminating records missing critical identifiers.
    

Data Quality Rules Applied: 1. Each transaction must be uniquely identifiable by transactionid.
    						2. Records must contain valid customer identifiers and transaction dates.
*/


-- Remove duplicate transaction records based on transactionid
-- Retains a single occurrence of each transaction
DELETE FROM transactions_cleaned t
USING (
    SELECT
        transactionid,
        ROW_NUMBER() OVER (PARTITION BY transactionid ORDER BY transactionid) AS rn
    FROM transactions_cleaned
) d
WHERE t.transactionid = d.transactionid
  AND d.rn > 1;


-- Remove records with missing critical fields required for analysis
DELETE FROM transactions_cleaned
WHERE customerid IS NULL
   OR transactiondate IS NULL;
