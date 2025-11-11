{{
    config(
        materialized='ephemeral'
    )
}}

select
    *
from {{ ref('dim_products') }}
where category = 'Accessories'