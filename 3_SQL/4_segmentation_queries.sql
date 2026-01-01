/*
File Name  : 4_segmentation_queries.sql
Author     : Ujjwal Verma

Objective:  Segment customers into meaningful value-based categories using
transaction spending behavior to support targeted analysis and reporting.
   

Context: Customer segmentation is required to differentiate high-value, medium-value,
and low-value customers based on their total spending. Instead of using fixed monetary 
thresholds, a quantile-based approach is applied to ensure balanced and data-driven segmentation.
   

Segmentation Methodology:  - Customers are divided into three segments using spending percentiles:
        						• Low Value     – Bottom 33% of customers by total spend
        						• Standard      – Middle 33% of customers
        						• Premium       – Top 33% of customers
   						   - This approach adapts automatically to the data distribution and 
   						     avoids bias caused by arbitrary thresholds.
*/


-- Add a segment column to store customer value classification
ALTER TABLE customer_summary
ADD COLUMN segment VARCHAR(50);


-- Apply quantile-based segmentation using total spending
-- This ensures balanced segment sizes and consistent analytical comparisons
WITH quantiles AS (
    SELECT
        PERCENTILE_CONT(0.33) WITHIN GROUP (ORDER BY totalamountspent) AS q1,
        PERCENTILE_CONT(0.66) WITHIN GROUP (ORDER BY totalamountspent) AS q2
    FROM customer_summary
)
UPDATE customer_summary
SET segment =
    CASE
        WHEN totalamountspent <  (SELECT q1 FROM quantiles) THEN 'Low Value'
        WHEN totalamountspent >= (SELECT q1 FROM quantiles)
             AND totalamountspent <  (SELECT q2 FROM quantiles) THEN 'Standard'
        ELSE 'Premium'
    END;


-- Validate segmentation distribution to ensure balanced customer groups
SELECT
    segment,
    COUNT(*) AS customer_count
FROM customer_summary
GROUP BY segment;


