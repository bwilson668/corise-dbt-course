WITH source AS (
    SELECT
        *
    FROM
        {{ source(
            'greenery',
            'events'
        ) }}
),
renamed AS (
    SELECT
        id,
        event_id,
        session_id,
        user_id,
        page_url,
        created_at AS event_created_at,
        event_type
    FROM
        source
)
SELECT
    *
FROM
    renamed
