WITH dim_customer__source AS(
  SELECT 
    *
  FROM `vit-lam-data.wide_world_importers.sales__customers`
)

, dim_customer__rename AS(
  SELECT
    customer_id AS customer_key
    , customer_name AS customer_name
    , customer_category_id AS customer_category_key
    , buying_group_id AS buying_group_key
  FROM dim_customer__source
)

, dim_customer_cast_type AS(
  SELECT
    CAST(customer_key AS INTEGER) AS customer_key
    , CAST(customer_name AS STRING) AS customer_name
    , CAST(customer_category_key AS INTEGER) AS customer_category_key
    , CAST(buying_group_key AS INTEGER) AS buying_group_key
  FROM dim_customer__rename
)

SELECT 
  customer_key
  , customer_name
  , customer_category_key
  , customer_category_name
  , buying_group_key
  , buying_group_name
FROM dim_customer_cast_type
LEFT JOIN {{ ref('stg_dim_buying_group') }} USING(buying_group_key)
LEFT JOIN {{ ref('stg_dim_customer_category')}} USING(customer_category_key)