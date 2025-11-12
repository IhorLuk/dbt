{{
    config(
        materialized='table'
    )
}}

SELECT *
FROM {{ ref('src_order_items') }}