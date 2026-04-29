SELECT
    order_year,
    order_month,
    order_month_name,
    ROUND(SUM(sales), 2)              AS monthly_sales,
    COUNT(DISTINCT order_id)          AS orders,
    ROUND(AVG(SUM(sales)) OVER (
        ORDER BY order_year, order_month
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
    ), 2)                             AS sales_3mo_avg,
    ROUND(SUM(SUM(sales)) OVER (
        PARTITION BY order_year
        ORDER BY order_month
    ), 2)                             AS ytd_sales
FROM global_superstore
GROUP BY order_year, order_month, order_month_name
ORDER BY order_year, order_month;