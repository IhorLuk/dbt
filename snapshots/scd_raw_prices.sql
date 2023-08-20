{% snapshot scd_raw_prices %}

{{
    config(
        target_schema='dbt_ihorluk',
        unique_key='SurrogateKey',
        strategy='timestamp',
        updated_at='updated_at',
        invalidate_hard_deletes=True
    )
}}

SELECT * FROM {{ source('avocado', 'avocado_prices')}}

{% endsnapshot %}