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

**Known data limitation**: order volume drops by over 95% from May 2018
onward (from 35-125 orders/month down to 1-4), with order_status also
shifting almost entirely to a single value. This is consistent with an
incomplete data extract rather than an actual business slowdown. Any
analysis or dashboard using this model should treat data from May 2018
onward as unreliable for trend interpretation, and rely primarily on the
January 2016 - April 2018 window for month-over-month comparisons.

{% enddocs %}