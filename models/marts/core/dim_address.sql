with address as (
    select * from {{ ref('stg_address') }}
)

select
    address_id,
    address_line_1,
    address_line_2,
    city,
    state_province_id,
    postal_code
from address