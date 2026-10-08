with source as (

    select * from {{ source('adventure_works', 'person_countryregion') }}

),

renamed as (

    select
        -- Chaves (IDs / Códigos)
        cast(countryregioncode as string) as country_region_code,

        -- Atributos de Descrição
        cast(name as string) as country_region_name,

        -- Metadados / Datas
        cast(modifieddate as timestamp) as updated_at

    from source

)

select * from renamed