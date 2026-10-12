with vendor as (
    select * from {{ ref('stg_purchasing_vendor') }}
)

select
    business_entity_id as vendor_id,
    account_number,
    vendor_name,
    credit_rating,
    preferred_vendor_status,
    active_flag,
    purchasing_web_service_url,
    modified_date
from vendor