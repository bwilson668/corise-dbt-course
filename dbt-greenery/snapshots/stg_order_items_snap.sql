{% snapshot stg_order_items_snap %}

{{
    config(
        target_schema='snapshots',
        unique_key='id',

        strategy='check',
        check_cols=['quantity'],
        invalidate_hard_deletes=True,
    )
}}

SELECT *
FROM {{ ref('stg_order_items') }}

{% endsnapshot %}