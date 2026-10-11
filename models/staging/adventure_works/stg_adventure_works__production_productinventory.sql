with source as (

    select * from {{ source('adventure_works', 'production_productinventory') }}

),

renamed as (

    select
        -- Chaves (IDs)
        cast(productid as int) as product_id,
        cast(locationid as int) as location_id,

        -- Informações de Armazém e Localização
        cast(shelf as string) as shelf,
        cast(bin as int) as bin,
        cast(quantity as int) as quantity,

        -- Metadados / Datas
        cast(rowguid as string) as row_guid,
        cast(modifieddate as timestamp) as updated_at

    from source

)

select * from renamed