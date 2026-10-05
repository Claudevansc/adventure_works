select
    salesorderid as sales_order_id,
    revisionnumber as revision_number,
    orderdate as order_date,
    duedate as due_date,
    shipdate as ship_date,
    status as order_status,
    onlineorderflag as online_order_flag,
    purchaseordernumber as purchase_order_number,
    customerid as customer_id,
    salespersonid as sales_person_id,
    territoryid as territory_id,
    billtoaddressid as bill_to_address_id,   -- << ADICIONADO
    creditcardid as credit_card_id,           -- << ADICIONADO
    subtotal,
    taxamt as tax_amt,
    freight,
    totaldue as total_due

from {{ source('adventure_works', 'sales_salesorderheader') }}