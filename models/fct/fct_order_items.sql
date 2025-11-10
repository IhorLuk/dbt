{{
    config(
        materialized='table'
    )
}}

SELECT *
from {{ ref('src_order_items') }}