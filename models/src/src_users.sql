WITH raw_users AS (
  SELECT *
  FROM {{ source('ecommerce', 'users')}}
)

select
    id
    ,first_name
    ,last_name
    ,email
    ,age
    ,gender
    ,states
    ,city
    ,country
    ,traffic_source
    ,created_at
from raw_users