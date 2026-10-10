with source as (

    select * from {{ source('adventure_works', 'person_countryregion') }}

),

renamed as (

    select
        cast(countryregioncode as string) as country_region_code,
        cast(name as string) as country_region_name,
        cast(modifieddate as timestamp) as updated_at

    from source
    where countryregioncode is not null

)

select * from renamed