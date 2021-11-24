WITH source AS (
    SELECT
        *
    FROM
        {{ source(
            'greenery',
            'users'
        ) }}
),
renamed AS (
    SELECT
        id,
        user_id,
        first_name,
        last_name,
        email,
        phone_number,
        created_at,
        updated_at,
        address_id
    FROM
        source
)
SELECT
    *
FROM
    renamed
