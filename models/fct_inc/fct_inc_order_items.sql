-- dbt run --select fct_inc_order_items --vars '{lookback_days: 30}'

{{
    config(
        materialized='incremental',
        unique_key='id',
        incremental_strategy='merge',
        on_schema_change='sync_all_columns'
    )
}}

{% set lookback_days = var('lookback_days', 14) %}

SELECT
    *,
    CURRENT_TIMESTAMP AS _dbt_updated_at
FROM {{ ref('src_order_items') }}

{% if is_incremental() %}
    WHERE created_at >= TIMESTAMP(CURRENT_DATE() - INTERVAL {{ lookback_days }} DAY)
{% endif %}