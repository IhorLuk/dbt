SELECT *
FROM {{ ref('fct_avocado')}}
WHERE avg_price <= 0
LIMIT 10