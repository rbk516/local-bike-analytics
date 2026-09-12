{% docs mrt_sales__performance %}

## mrt_sales__performance

Monthly sales performance recap, broken down by store, product category,
and brand. Built from int_sales__order_items_enriched.

Grain: one row per month, store, category, and brand combination.

Key metrics:
- total_orders: distinct number of orders
- total_items_sold: total quantity of items sold
- total_revenue: net revenue after discount (list_price * quantity * (1 - discount))
- avg_order_value: total_revenue divided by total_orders

{% enddocs %}