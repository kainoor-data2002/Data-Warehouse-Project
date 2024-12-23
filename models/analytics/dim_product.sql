WITH 
dim_product__source AS (
  SELECT *
  FROM `vit-lam-data.wide_world_importers.warehouse__stock_items`
),

dim_product__rename_column AS (
  SELECT 
    stock_item_id AS product_key,
    stock_item_name AS product_name,
    brand AS brand_name
  FROM dim_product__source
),

dim_product__cast_type AS (
SELECT 
  CAST(dprc.product_key AS INTEGER) AS product_key,
  CAST(dprc.product_name AS STRING) AS product_name,
  CAST(dprc.brand_name AS STRING) AS brand_name
FROM dim_product__rename_column AS dprc
)


SELECT*
FROM dim_product__cast_type