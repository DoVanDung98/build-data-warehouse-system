SELECT 
  CAST(stock_item_id as INTEGER) as product_key
  , CAST(stock_item_name as STRING) as product_name
  , CAST(brand as STRING) as brand_name
FROM `vit-lam-data.wide_world_importers.warehouse__stock_items`