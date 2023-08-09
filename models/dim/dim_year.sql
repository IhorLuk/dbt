{{
    config(
        materialized='table'
    )
}}
WITH src_avocado AS (
    SELECT * FROM {{ ref('src_avocado')}}
), t1 AS (
    SELECT DISTINCT(year) as year
    FROM src_avocado
)

SELECT year, CAST(ROW_NUMBER () OVER(ORDER BY year) AS INT64) AS id
FROM t1