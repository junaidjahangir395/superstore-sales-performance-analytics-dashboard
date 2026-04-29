USE portfolio_db;

SELECT
    city,
    state,
    region,
    COUNT(DISTINCT order_id)              AS orders,
    COUNT(DISTINCT customer_id)           AS customers,
    ROUND(SUM(sales), 2)                  AS total_sales,
    ROUND(AVG(sales), 2)                  AS avg_order_value,
    ROUND(
        SUM(sales) /
        (SELECT SUM(sales) FROM global_superstore)
        * 100
    , 1)                                  AS sales_share_pct
FROM global_superstore
GROUP BY city, state, region
ORDER BY total_sales DESC
LIMIT 10;