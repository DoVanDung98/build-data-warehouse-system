WITH dim_supplider__source AS(
  SELECT 
    *
  FROM `vit-lam-data.wide_world_importers.purchasing__suppliers`
)

, dim_supplider__rename AS(
  SELECT
    supplier_id AS supplier_key
    , supplier_name AS supplier_name
  FROM dim_supplider__source
)

, dim_supplider__cast_type AS(
  SELECT 
    CAST(supplier_key AS INTEGER) AS supplier_key
    , CAST(supplier_name AS STRING) AS supplier_name
  FROM dim_supplider__rename
)

SELECT * FROM dim_supplider__cast_type