with product_category as (
    select * from {{ ref('stg_production_productcategory') }}
)

select
    product_category_id,
    product_category_name,
    row_guid,
    modified_date
from product_category