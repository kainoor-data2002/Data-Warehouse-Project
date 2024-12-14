WITH 
dim_customer__source AS (
  SELECT *
  FROM `vit-lam-data.wide_world_importers.sales__customers`
),

dim_customer__rename_column AS (
  SELECT 
    customer_id AS customer_key,
    customer_name AS customer_name
  FROM dim_customer__source
),

dim_customer__cast_type AS (
  SELECT 
    CAST(dcrc.customer_key AS INTEGER) AS customer_key,
    CAST(dcrc.customer_name AS STRING) AS customer_name
  FROM dim_customer__rename_column AS dcrc
)

SELECT
  customer_key,
  customer_name
FROM dim_customer__cast_type
