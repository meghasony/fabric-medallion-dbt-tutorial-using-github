{{ config(materialized='table', tags=['silver']) }}

WITH cleaned AS (

    SELECT
        customer_id,
        UPPER(LEFT(customer_name, 1)) + LOWER(SUBSTRING(customer_name, 2, LEN(customer_name))) AS customer_name,
        {{ dbt_utils.coalesce([
            "NULLIF(LTRIM(RTRIM(country)), '')",
            "'UNKNOWN'"
        ]) }} AS country
    FROM bronze_customers

)

SELECT DISTINCT * FROM cleaned
