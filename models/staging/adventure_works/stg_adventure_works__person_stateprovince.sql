with source as (

    select * from {{ source('adventure_works', 'person_stateprovince') }}

),

renamed as (

    select
        -- Chaves (IDs / Códigos)
        cast(stateprovinceid as int) as state_province_id,
        cast(territoryid as int) as sales_territory_id,
        cast(countryregioncode as string) as country_region_code,

        -- Atributos do Estado / Província
        cast(stateprovincecode as string) as state_province_code,
        cast(name as string) as state_province_name,
        cast(isonlystateprovinceflag as boolean) as is_only_state_province_flag,

        -- Metadados / Datas
        cast(modifieddate as timestamp) as updated_at

        -- Nota: A coluna 'rowguid' foi omitida por ser um identificador técnico sem valor analítico.

    from source

)

select * from renamed