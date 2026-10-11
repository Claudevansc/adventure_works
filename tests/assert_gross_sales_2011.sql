with sales_2011 as (
    select
        sum(gross_revenue_amount) as total_gross_sales 
    from {{ ref('fct_sales') }}
    where extract(year from order_date) = 2011
)

select 
    total_gross_sales,
    12646112.16 as expected_sales
from sales_2011
where round(total_gross_sales, 2) != 12646112.16