with source as (

    select * from {{ source('adventure_works', 'purchasing_purchaseorderheader') }}

),

renamed as (

    select
        -- Chaves (IDs)
        cast(purchaseorderid as int) as purchase_order_id,
        cast(employeeid as int) as employee_id,
        cast(vendorid as int) as vendor_id,
        cast(shipmethodid as int) as ship_method_id,

        -- Informações do Pedido
        cast(revisionnumber as int) as revision_number,
        cast(status as int) as status,

        -- Valores Financeiros
        cast(subtotal as numeric) as subtotal,
        cast(taxamt as numeric) as tax_amount,
        cast(freight as numeric) as freight,

        -- Datas / Auditoria
        cast(orderdate as timestamp) as order_date,
        cast(shipdate as timestamp) as ship_date,
        cast(modifieddate as timestamp) as updated_at

    from source

)

select * from renamed