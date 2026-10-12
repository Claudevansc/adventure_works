select
    addressid as address_id,
    addressline1 as address_line_1,
    addressline2 as address_line_2,
    city,
    stateprovinceid as state_province_id,
    postalcode as postal_code

from {{ source('adventure_works', 'person_address') }}