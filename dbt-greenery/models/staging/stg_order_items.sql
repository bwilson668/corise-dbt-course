WITH source AS (
    SELECT
        *
    FROM
        {{ source(
            'greenery',
            'order_items'
        ) }}
),
renamed AS (
    SELECT
        id,
        order_id,
        product_id,
        quantity
    FROM
        source
)
SELECT
    *
FROM
    renamed
