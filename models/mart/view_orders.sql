{{
    config(
        materialized='view'
    )
}}

select
    oi.*
    ,u.gender
    ,u.state
    ,u.country
    ,u.traffic_source
    ,p.cost
    ,p.category
from {{ ref('src_order_items') }} oi
join {{ ref('dim_users') }} u
    on oi.user_id = u.id
join {{ ref('dim_products') }} p
    on oi.product_id = p.id