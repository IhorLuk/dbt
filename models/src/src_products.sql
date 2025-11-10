WITH raw_products AS (
  SELECT *
  FROM {{ source('ecommerce', 'products')}}
)

select
    id
    ,cost
    ,category
    ,name
    ,brand
    ,retail_price
    ,department
    ,sku
    ,distribution_center_id
from raw_products