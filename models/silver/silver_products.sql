{{ config(materialized='table', tags=['silver']) }}

SELECT
    product_id,
    product_name,
    category,
    {{ dbt_utils.safe_cast("price", api.Column.translate_type("float")) }} AS price
FROM bronze_products
WHERE {{ dbt_utils.safe_cast("price", api.Column.translate_type("float")) }} IS NOT NULL
