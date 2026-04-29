USE portfolio_db;

SELECT
    order_year                            AS year,
    COUNT(DISTINCT order_id)              AS total_orders,
    COUNT(DISTINCT customer_id)           AS unique_customers,
    ROUND(SUM(sales), 2)                  AS total_sales,
    ROUND(AVG(sales), 2)                  AS avg_order_value
FROM global_superstore
GROUP BY order_year
ORDER BY order_year;