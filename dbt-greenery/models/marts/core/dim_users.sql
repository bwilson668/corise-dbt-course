SELECT
    user_id,
    first_name,
    last_name,
    email,
    phone_number,
    user_created_at,
    address,
    zipcode,
    state,
    country
FROM
    {{ ref('stg_users') }}
    u
    LEFT JOIN {{ ref('stg_addresses') }} A
    ON A.address_id = u.address_id
