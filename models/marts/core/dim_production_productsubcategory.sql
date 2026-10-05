with product_subcategory as (
    select * from {{ ref('stg_production_productsubcategory') }}
)

select
    product_subcategory_id,
    product_category_id,
    product_subcategory_name,
    row_guid,
    modified_date
from product_subcategory