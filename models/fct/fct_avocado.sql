{{
    config(
        materialized='table',
        on_schema_change='fail'
    )
}}
WITH src_avocado AS (
    SELECT *
    FROM {{ ref('src_avocado')}}
)

SELECT 
    {{ dbt_utils.surrogate_key(['date', 'total_bags'])}} as local_id,
    date, avg_price, total_volume, total_bags, y.id as year_id
FROM src_avocado a
JOIN {{ ref('dim_year') }} as y
    ON a.year = y.year
{% if is_incremental() %}
    AND a.date > (select max(a.date) from {{ this }})
{% endif %}