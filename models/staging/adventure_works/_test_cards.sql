select distinct card_type
from {{ ref('stg_adventure_works__sales_creditcard') }}