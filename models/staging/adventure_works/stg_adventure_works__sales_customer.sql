with source as (

    select * from {{ source('adventure_works', 'sales_customer') }}

),

renamed as (

    select
        -- Chaves (IDs)
        cast(customerid as int) as customer_id,
        cast(personid as int) as person_id,
        cast(storeid as int) as store_id,
        cast(territoryid as int) as territory_id,

        -- Metadados / Identificadores únicos globais
        cast(rowguid as string) as row_guid,

        -- Datas / Auditoria
        cast(modifieddate as timestamp) as updated_at

    from source

)

select * from renamed