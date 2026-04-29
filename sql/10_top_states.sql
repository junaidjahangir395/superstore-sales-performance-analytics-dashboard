USE portfolio_db;

SELECT
    state,
    region,
    COUNT(DISTINCT order_id)              AS orders,
    COUNT(DISTINCT customer_id)           AS customers,
    ROUND(SUM(sales), 2)                  AS total_sales,
    ROUND(AVG(sales), 2)                  AS avg_order_value,
    RANK() OVER (
        ORDER BY SUM(sales) DESC
    )                                     AS sales_rank
FROM global_superstore
GROUP BY state, region
ORDER BY total_sales DESC
LIMIT 10;