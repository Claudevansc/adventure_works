select
    businessentityid as business_entity_id,
    accountnumber as account_number,
    name as vendor_name,
    creditrating as credit_rating,
    preferredvendorstatus as preferred_vendor_status,
    activeflag as active_flag,
    purchasingwebserviceurl as purchasing_web_service_url,
    modifieddate as modified_date

from {{ source('adventure_works', 'purchasing_vendor') }}