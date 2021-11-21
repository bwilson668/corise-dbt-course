{% snapshot stg_promos_snapshot %}

{{
    config(
        target_schema='snapshots',
        unique_key='promo_id',

        strategy='check',
        check_cols=['status'],
        invalidate_hard_deletes=True,
    )
}}

SELECT * 
FROM {{ ref('stg_promos') }}

{% endsnapshot %}