WITH raw_avocado AS (
  SELECT *
  FROM `winter-cocoa-336514.avocado_data.avocado_prices`
)

SELECT
  date,
  year,
  region as origin_region,
  AveragePrice as avg_price,
  Total_Volume as total_volume,
  Total_Bags as total_bags
FROM raw_avocado