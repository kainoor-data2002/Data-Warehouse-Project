WITH 
fact_sales_order__source AS (
  SELECT *
  FROM `vit-lam-data.wide_world_importers.sales__orders`
),

fact_sales_order__cast_type AS (
  SELECT 
    CAST(order_id AS INTEGER) AS sales_order_key,
    CAST(customer_id AS INTEGER) AS customer_key
  FROM fact_sales_order__source
)

SELECT
  sales_order_key,
  customer_key
FROM fact_sales_order__cast_type