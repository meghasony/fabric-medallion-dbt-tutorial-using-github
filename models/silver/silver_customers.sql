{{ config(materialized='table', tags=['silver']) }}

SELECT
    customer_id,
    UPPER(LEFT(customer_name, 1)) + LOWER(SUBSTRING(customer_name, 2, LEN(customer_name))) AS customer_name,
    CASE 
        WHEN country IS NULL OR LTRIM(RTRIM(country)) = '' 
            THEN 'UNKNOWN'
        ELSE UPPER(country)
    END AS country
FROM bronze_customers
