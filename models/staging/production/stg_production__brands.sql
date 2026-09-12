select
    brand_id,
    brand_name
from {{ source('production', 'brands') }}