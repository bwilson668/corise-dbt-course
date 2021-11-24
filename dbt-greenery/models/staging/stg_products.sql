WITH source AS (
    SELECT
        *
    FROM
        {{ source(
            'greenery',
            'products'
        ) }}
),
renamed AS (
    SELECT
        id,
        product_id,
        NAME AS product_name,
        price,
        quantity
    FROM
        source
)
SELECT
    *
FROM
    renamed
