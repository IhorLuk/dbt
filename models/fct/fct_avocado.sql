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
    date, avg_price, total_volume, total_bags, y.id as year_id, r.id as region_id
FROM src_avocado a
JOIN {{ ref('dim_year') }} as y
    ON a.year = y.year
JOIN {{ ref('dim_region') }} as r
    ON a.origin_region = r.origin_region
{% if is_incremental() %}
    AND a.date > (select max(a.date) from {{ this }})
{% endif %}