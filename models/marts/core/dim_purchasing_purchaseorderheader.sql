with purchase_order_header as (
    select * from {{ ref('stg_purchasing_purchaseorderheader') }}
)

select
    purchase_order_id,
    revision_number,
    status,
    employee_id,
    vendor_id,
    ship_method_id,
    order_date,
    ship_date,
    subtotal,
    tax_amt,
    freight,
    modified_date
from purchase_order_header