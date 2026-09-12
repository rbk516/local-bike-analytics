select
    oi.order_item_id,
    oi.order_id,
    o.order_date,
    o.order_status,
    o.store_id,
    s.store_name,
    s.city as store_city,
    s.state as store_state,
    oi.product_id,
    p.product_name,
    p.model_year,
    c.category_name,
    b.brand_name,
    oi.quantity,
    oi.list_price,
    oi.discount,
    oi.net_amount
from {{ ref('stg_sales__order_items') }} as oi
left join {{ ref('stg_sales__orders') }} as o on o.order_id = oi.order_id
left join {{ ref('stg_sales__stores') }} as s on s.store_id = o.store_id
left join {{ ref('stg_production__products') }} as p on p.product_id = oi.product_id
left join {{ ref('stg_production__categories') }} as c on c.category_id = p.category_id
left join {{ ref('stg_production__brands') }} as b on b.brand_id = p.brand_id