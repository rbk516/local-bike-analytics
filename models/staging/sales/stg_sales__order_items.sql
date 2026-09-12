select
    concat(order_id, '_', item_id) as order_item_id,
    order_id,
    item_id,
    product_id,
    quantity,
    list_price,
    discount,
    round(quantity * list_price * (1 - discount), 2) as net_amount
from {{ source('sales', 'order_items') }}