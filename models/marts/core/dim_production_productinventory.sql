with product_inventory as (
    select * from {{ ref('stg_production_productinventory') }}
)

select
    product_id,
    location_id,
    shelf,
    bin,
    quantity,
    row_guid,
    modified_date
from product_inventory