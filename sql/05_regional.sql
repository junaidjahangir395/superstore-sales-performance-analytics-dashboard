SELECT
    region,
    COUNT(DISTINCT order_id)          AS orders,
    COUNT(DISTINCT customer_id)       AS customers,
    ROUND(SUM(sales), 2)              AS total_sales,
    ROUND(AVG(sales), 2)              AS avg_order_value,
    ROUND(AVG(days_to_ship), 1)       AS avg_ship_days,
    ROUND(SUM(sales) /
          SUM(SUM(sales)) OVER ()
          * 100, 1)                   AS sales_share_pct,
    RANK() OVER (
        ORDER BY SUM(sales) DESC
    )                                 AS sales_rank
FROM global_superstore
GROUP BY region
ORDER BY total_sales DESC;