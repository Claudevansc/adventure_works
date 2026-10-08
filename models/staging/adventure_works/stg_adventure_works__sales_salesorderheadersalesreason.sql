with source as (

    select * from {{ source('adventure_works', 'sales_salesorderheadersalesreason') }}

),

renamed as (

    select
        -- Chaves (IDs / Tabela de Ligação)
        cast(salesorderid as int) as sales_order_id,
        cast(salesreasonid as int) as sales_reason_id,

        -- Metadados / Datas
        cast(modifieddate as timestamp) as updated_at

    from source

)

select * from renamed