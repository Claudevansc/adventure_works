with sales_order_detail as (
    select * from {{ ref('stg_sales_salesorderdetail') }}
)

select
    sales_order_id,
    sales_order_detail_id,
    carrier_tracking_number,
    order_qty,
    product_id,
    special_offer_id,
    unit_price,
    unit_price_discount
from sales_order_detail