with sales_territory as (
    select * from {{ ref('stg_sales_salesterritory') }}
)

select
    territory_id,
    territory_name,
    country_region_code,
    sales_group,
    sales_ytd,
    sales_last_year,
    cost_ytd,
    cost_last_year
from sales_territory