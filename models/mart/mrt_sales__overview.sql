select
    date_trunc(order_date, month) as order_month,
    store_id,
    store_name,
    count(distinct order_id) as total_orders,
    round(sum(net_amount), 2) as total_revenue,
    round(sum(net_amount) / count(distinct order_id), 2) as avg_order_value
from {{ ref('int_sales__order_items_enriched') }}
group by order_month, store_id, store_name