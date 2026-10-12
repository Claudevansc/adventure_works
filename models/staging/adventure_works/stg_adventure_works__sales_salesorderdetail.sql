with source as (

    select * from {{ source('adventure_works', 'sales_salesorderdetail') }}

),

renamed as (

    select
        -- Chaves (IDs)
        cast(salesorderid as int) as sales_order_id,
        cast(salesorderdetailid as int) as sales_order_detail_id,
        cast(productid as int) as product_id,
        cast(specialofferid as int) as special_offer_id,

        -- Informações do Pedido / Rastreio
        cast(carriertrackingnumber as string) as carrier_tracking_number,
        cast(orderqty as int) as order_quantity,

        -- Valores Financeiros
        cast(unitprice as numeric) as unit_price,
        cast(unitpricediscount as numeric) as unit_price_discount,

        -- Metadados / Datas
        cast(rowguid as string) as row_guid,
        cast(modifieddate as timestamp) as updated_at

    from source

)

select * from renamed