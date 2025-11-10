{{
    config(
        materialized='table'
    )
}}

SELECT *
from {{ ref('src_orders') }}