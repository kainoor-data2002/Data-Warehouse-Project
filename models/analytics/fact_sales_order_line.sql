WITH 
fact_sales_order_line__source AS (
  SELECT *
  FROM `vit-lam-data.wide_world_importers.sales__order_lines`
),

fact_sales_order_line__cast_type AS (
  SELECT 
    CAST(order_line_id AS INTEGER) AS sales_order_line_key,
    CAST(order_id AS INTEGER) AS sales_order_key,
    CAST(stock_item_id AS INTEGER) AS product_key,
    CAST(quantity AS INTEGER) AS quantity,
    CAST(unit_price AS NUMERIC) AS unit_price,
    CAST(quantity AS INTEGER) * CAST(unit_price AS NUMERIC) AS gross_amount
  FROM fact_sales_order_line__source
)

SELECT
  sales_order_line_key,
  fact_header.sales_order_key,
  product_key,
  fact_header.customer_key,
  quantity,
  unit_price,
  gross_amount
FROM fact_sales_order_line__cast_type 
/*LEFT JOIN `vit-lam-data.wide_world_importers_dwh_staging.stg_fact_sales_order` AS fact_header*/
LEFT JOIN `dbt-data-warehouse-442608.ecentric_kietnguyen_learndbt_staging.stg_fact_sales_order` AS fact_header
ON fact_sales_order_line__cast_type.sales_order_key = fact_header.sales_order_key
