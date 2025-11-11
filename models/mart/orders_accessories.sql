{{
    config(
        materialized='view'
    )
}}

select
    oi.order_id
    ,count(*) as cnt
    ,sum(sale_price) as sum_price
from {{ ref('src_order_items') }} oi
join {{ ref('tmp_accessories') }} acc
    on oi.product_id = acc.id
group by oi.order_id