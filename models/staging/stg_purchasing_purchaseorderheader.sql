select
    purchaseorderid as purchase_order_id,
    revisionnumber as revision_number,
    status,
    employeeid as employee_id,
    vendorid as vendor_id,
    shipmethodid as ship_method_id,
    orderdate as order_date,
    shipdate as ship_date,
    subtotal,
    taxamt as tax_amt,
    freight,
    modifieddate as modified_date

from {{ source('adventure_works', 'purchasing_purchaseorderheader') }}