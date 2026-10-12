with source as (

    select * from {{ source('adventure_works', 'person_address') }}

),

renamed as (

    select
        -- Chaves (IDs)
        cast(addressid as int) as address_id,
        cast(stateprovinceid as int) as state_province_id,

        -- Endereço e Localização
        cast(addressline1 as string) as address_line_1,
        cast(addressline2 as string) as address_line_2,
        cast(city as string) as city_name,
        cast(postalcode as string) as postal_code,
        cast(spatiallocation as string) as spatial_location,

        -- Metadados / Datas
        cast(modifieddate as timestamp) as updated_at

        -- Nota: A coluna 'rowguid' foi omitida por ser um identificador técnico interno sem valor analítico.

    from source

)

select * from renamed