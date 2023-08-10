{{
    config(
        materialized='table'
    )
}}
WITH src_avocado AS (
    SELECT * FROM {{ ref('src_avocado')}}
), t1 AS (
    SELECT DISTINCT(origin_region) as origin_region
    FROM src_avocado
)

SELECT origin_region, CAST(ROW_NUMBER () OVER(ORDER BY origin_region) AS INT64) AS id
FROM t1