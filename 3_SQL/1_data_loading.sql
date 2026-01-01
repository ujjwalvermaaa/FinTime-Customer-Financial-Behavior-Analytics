/*
File Name  : 1_data_loading.sql
Author     : Ujjwal Verma

Objective: Define the base transactions table that will be used as the primary analytical 
dataset for the FinTime Customer Financial Behavior Analytics project.

   		  
Context: This table stores transaction-level data after initial preprocessing and schema 
standardization. It acts as the foundation for all downstream SQL transformations, customer
segmentation, churn analysis, KPI calculations, and dashboard reporting.
    

Data Source: Data is imported from a CSV file using DBeaver to ensure controlled and 
reproducible ingestion.
    

Notes:  - This script defines the table structure only.
   		- Data population is handled via external CSV import.
*/

CREATE TABLE IF NOT EXISTS transactions_cleaned (
    transactionid VARCHAR(50),
    customerid VARCHAR(50),
    customerdob DATE,
    custgender VARCHAR(20),
    custlocation VARCHAR(200),
    custaccountbalance NUMERIC(18,2),
    transactiondate DATE,
    transactiontime INT,
    transactionamountinr NUMERIC(18,2),
    transactionhour INT
);
