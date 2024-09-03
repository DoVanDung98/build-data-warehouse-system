WITH fact_sales_order_line__source AS(
  SELECT
    *
  FROM `vit-lam-data.wide_world_importers.sales__order_lines` 
)

, fact_sales_order_line__rename AS(
  SELECT
    order_line_id AS sales_order_line_key
    , order_id AS sales_order_key
    , stock_item_id AS product_key
    , quantity AS quantity
    , unit_price AS unit_price
  FROM fact_sales_order_line__source
)

, fact_sales_order_line__cast_type AS(
  SELECT
    CAST(sales_order_line_key AS INTEGER) AS sales_order_line_key
    , CAST(sales_order_key AS INTEGER) AS sales_order_key
    , CAST(product_key AS INTEGER) AS product_key
    , CAST(quantity AS INTEGER) AS quantity
    , CAST(unit_price AS INTEGER) AS unit_price
  FROM fact_sales_order_line__rename
)

SELECT
  fact_line.sales_order_line_key
  , fact_line.sales_order_key
  , fact_line.product_key
  , fact_line.quantity
  , fact_line.unit_price
  , fact_header.customer_key
  , quantity * unit_price as gross_amount
FROM fact_sales_order_line__cast_type AS fact_line
LEFT JOIN `eco-channel-429606-p1.wide_world_importers_dwh_staging.stg_fact_sales_order` AS fact_header
ON fact_line.sales_order_key = fact_header.sales_order_key