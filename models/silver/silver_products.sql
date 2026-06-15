{{ config(materialized='table', tags=['silver']) }}

SELECT
    product_id,
    product_name,
    category,
    TRY_CAST(price AS DECIMAL(10,2)) AS price
FROM bronze_products
WHERE TRY_CAST(price AS DECIMAL(10,2)) IS NOT NULL
