{{
    config(
        materialized = 'table'
    )
}}

WITH fct_avocado AS (
    SELECT * FROM {{ ref('fct_avocado')}}
),
full_moon_dates AS (
    SELECT * FROM {{ ref('seed_full_moon_dates')}}
)

SELECT t1.*
FROM fct_avocado t1
JOIN full_moon_dates t2
ON t1.date = t2.full_moon_date