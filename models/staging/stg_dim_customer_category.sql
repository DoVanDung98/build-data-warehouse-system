WITH dim_customer__source AS(
  SELECT 
    *
  FROM `vit-lam-data.wide_world_importers.sales__customer_categories`
)

, dim_customer__rename AS(
  SELECT
    customer_category_id AS customer_category_key
    , customer_category_name AS customer_category_name
  FROM dim_customer__source
)

, dim_customer__cast_type AS(
  SELECT 
    CAST(customer_category_key AS INTEGER) AS customer_category_key
    , CAST(customer_category_name AS STRING) AS customer_category_name
  FROM dim_customer__rename
)

SELECT 
  customer_category_key
  , customer_category_name
FROM dim_customer__cast_type