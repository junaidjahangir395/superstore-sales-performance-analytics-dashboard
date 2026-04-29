USE portfolio_db;

SELECT
    category,
    sub_category,
    COUNT(DISTINCT order_id)              AS orders,
    ROUND(SUM(sales), 2)                  AS total_sales,
    ROUND(AVG(sales), 2)                  AS avg_sale_value,
    ROUND(
        SUM(sales) / 
        (SELECT SUM(sales) FROM global_superstore) 
        * 100
    , 1)                                  AS sales_share_pct
FROM global_superstore
GROUP BY category, sub_category
ORDER BY total_sales DESC;