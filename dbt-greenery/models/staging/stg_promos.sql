WITH source AS (
    SELECT
        *
    FROM
        {{ source(
            'greenery',
            'promos'
        ) }}
),
renamed AS (
    SELECT
        id,
        promo_id,
        discout AS discount,
        status AS promo_status
    FROM
        source
)
SELECT
    *
FROM
    renamed
