select sales_order_id, count(*) as total
from {{ ref('fct_sales') }}
where sales_order_id is not null
group by sales_order_id
having count(*) > 1