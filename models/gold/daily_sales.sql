{{ config(materialized='table', tags=['gold']) }}

SELECT
    order_date,
    SUM(TRY_CAST(quantity AS INT)) AS total_quantity
FROM {{ ref('silver_orders') }}
GROUP BY order_date
