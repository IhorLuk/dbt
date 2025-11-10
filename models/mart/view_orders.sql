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
from {{ ref('src_order_items') }} oi
join {{ ref('dim_users') }} u
    on oi.user_id = u.id