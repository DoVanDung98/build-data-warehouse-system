SELECT
  CAST(order_line_id as INTEGER) as sales_order_line_key
  , CAST(stock_item_id as INTEGER) as product_key
  , CAST(quantity as INTEGER) as quantity
  , CAST(unit_price as NUMERIC) as unit_price
  , CAST(quantity as INTEGER) * CAST(unit_price as INTEGER) as gross_amount
FROM `vit-lam-data.wide_world_importers.sales__order_lines` 