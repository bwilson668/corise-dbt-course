{% snapshot stg_orders_snap %}

{{
    config(
        target_schema='snapshots',
        unique_key='order_id',

        strategy='check',
        check_cols=['status'],
        invalidate_hard_deletes=True,
    )
}}

SELECT * 
FROM {{ ref('stg_orders') }}

{% endsnapshot %}