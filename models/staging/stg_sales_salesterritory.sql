select
    territoryid as territory_id,
    name as territory_name,
    countryregioncode as country_region_code,
    `group` as sales_group,
    salesytd as sales_ytd,
    saleslastyear as sales_last_year,
    costytd as cost_ytd,
    costlastyear as cost_last_year

from {{ source('adventure_works', 'sales_salesterritory') }}