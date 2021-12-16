{{ config(
    materialized = 'table'
) }}

{% set event_types = [ 'page_view' , 'add_to_cart' , 'delete_from_cart' ] %}
WITH {% for event_type in event_types %}
    {{ event_type }}_table AS (
        {{ funnel_step(event_type, ref('int_events')) }}),
        {% endfor %}

        checkout AS (
            SELECT
                DISTINCT session_id
            FROM
                {{ ref('int_events') }}
            WHERE
                event_type = 'checkout'
        )
        SELECT
            pwt.session_id,
            pwt.product_id,
            CASE
                WHEN COALESCE(
                    count_add_to_cart,
                    0
                ) > COALESCE(
                    count_delete_from_cart,
                    0
                ) THEN TRUE
                ELSE FALSE
            END AS is_in_cart,
            CASE
                WHEN C.session_id IS NOT NULL THEN TRUE
                ELSE FALSE
            END AS is_converted
        FROM
            page_view_table pwt
            LEFT JOIN add_to_cart_table atc
            ON atc.session_id = pwt.session_id
            AND atc.product_id = pwt.product_id
            LEFT JOIN delete_from_cart_table dfc
            ON dfc.session_id = pwt.session_id
            AND dfc.product_id = pwt.product_id
            LEFT JOIN checkout C
            ON C.session_id = pwt.session_id
