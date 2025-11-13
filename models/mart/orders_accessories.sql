{{
    config(
        materialized='view'
    )
}}

select
    oi.order_id
    ,count(*) as cnt
    ,sum(sale_price) as sum_price
    ,sum(acc.cost) as sum_cost
from {{ ref('src_order_items') }} oi
join {{ ref('dim_accessories') }} acc
    on oi.product_id = acc.id
group by oi.order_id