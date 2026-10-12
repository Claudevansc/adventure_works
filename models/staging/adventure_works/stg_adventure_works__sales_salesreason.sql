with source as (

    select * from {{ source('adventure_works', 'sales_salesreason') }}

),

renamed as (

    select
        -- Chaves (IDs)
        cast(salesreasonid as int) as sales_reason_id,

        -- Atributos do Motivo de Venda
        cast(name as string) as sales_reason_name,
        cast(reasontype as string) as reason_type,

        -- Metadados / Datas
        cast(modifieddate as timestamp) as updated_at

    from source

)

select * from renamed