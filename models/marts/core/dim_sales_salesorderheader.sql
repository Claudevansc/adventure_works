with sales_order_header as (
    select * from {{ ref('stg_sales_salesorderheader') }}
)

select
    sales_order_id,
    revision_number,
    order_date,
    due_date,
    ship_date,
    order_status,
    online_order_flag,
    purchase_order_number,
    customer_id,
    sales_person_id,
    territory_id,
    subtotal,
    tax_amt,
    freight,
    total_due
from sales_order_header