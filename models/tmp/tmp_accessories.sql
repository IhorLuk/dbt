{{
    config(
        materialized='ephemeral'
    )
}}

select
    id
    -- ,cost
    ,category
    ,name
    ,brand
    ,retail_price
    ,department
    ,sku
    ,distribution_center_id
from {{ ref('dim_products') }}
where category = 'Accessories'