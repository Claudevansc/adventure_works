with customer as (
    select * from {{ ref('stg_sales_customer') }}
)

select
    customer_id,
    person_id,
    store_id,
    territory_id,
    row_guid,
    modified_date
from customer