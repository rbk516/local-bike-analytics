select
    date_trunc(order_date, month) as order_month,
    store_id,
    store_name,
    store_city,
    store_state,
    category_name,
    brand_name,
    count(distinct order_id) as total_orders,
    sum(quantity) as total_items_sold,
    round(sum(net_amount), 2) as total_revenue,
    round(sum(net_amount) / count(distinct order_id), 2) as avg_order_value
from {{ ref('int_sales__order_items_enriched') }}
group by
    order_month,
    store_id,
    store_name,
    store_city,
    store_state,
    category_name,
    brand_name
order by order_month, store_name