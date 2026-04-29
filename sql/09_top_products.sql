USE portfolio_db;

SELECT
    product_id,
    MAX(product_name)                     AS product_name,
    MAX(category)                         AS category,
    MAX(sub_category)                     AS sub_category,
    COUNT(DISTINCT order_id)              AS orders,
    ROUND(SUM(sales), 2)                  AS total_sales,
    ROUND(AVG(sales), 2)                  AS avg_sale_price
FROM global_superstore
GROUP BY product_id
ORDER BY total_sales DESC
LIMIT 10;
