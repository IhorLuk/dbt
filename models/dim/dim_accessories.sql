{{
    config(
        materialized='table'
    )
}}

select
    *
from {{ ref('tmp_accessories') }}