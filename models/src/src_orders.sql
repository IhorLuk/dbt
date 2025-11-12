WITH raw_orders AS (
  SELECT *
  FROM {{ source('ecommerce', 'orders')}}
)

SELECT
  order_id,
  user_id,
  status,
  gender,
  created_at,
  returned_at,
  shipped_at,
  delivered_at,
  num_of_item
FROM raw_orders