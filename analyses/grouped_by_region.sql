SELECT rgn.origin_region, AVG(fct.avg_price) as avg_price
FROM {{ref ('fct_avocado')}} fct
JOIN {{ref ('dim_region')}} rgn
ON fct.region_id = rgn.id
GROUP BY rgn.origin_region
ORDER BY avg_price DESC