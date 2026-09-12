select
    store_id,
    store_name,
    city,
    state,
    zip_code
from {{ source('sales', 'stores') }}