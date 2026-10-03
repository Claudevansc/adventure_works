select
    productid as product_id,
    locationid as location_id,
    shelf,
    bin,
    quantity,
    rowguid as row_guid,
    modifieddate as modified_date

from {{ source('adventure_works', 'production_productinventory') }}