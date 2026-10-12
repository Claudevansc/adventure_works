with source as (

    select * from {{ source('adventure_works', 'purchasing_purchaseorderdetail') }}

),

renamed as (

    select
        -- Chaves (IDs)
        cast(purchaseorderid as int) as purchase_order_id,
        cast(purchaseorderdetailid as int) as purchase_order_detail_id,
        cast(productid as int) as product_id,

        -- Informações de Quantidade
        cast(orderqty as int) as order_quantity,
        cast(receivedqty as numeric) as received_quantity,
        cast(rejectedqty as numeric) as rejected_quantity,

        -- Valores Financeiros
        cast(unitprice as numeric) as unit_price,

        -- Datas / Auditoria
        cast(duedate as timestamp) as due_date,
        cast(modifieddate as timestamp) as updated_at

    from source

)

select * from renamed