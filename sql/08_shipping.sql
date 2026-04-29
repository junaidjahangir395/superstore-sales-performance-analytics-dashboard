SELECT
    ship_mode,
    COUNT(DISTINCT order_id)          AS orders,
    ROUND(AVG(days_to_ship), 1)       AS avg_days_to_ship,
    MIN(days_to_ship)                 AS min_days,
    MAX(days_to_ship)                 AS max_days,
    ROUND(SUM(sales), 2)              AS total_sales,
    ROUND(COUNT(DISTINCT order_id) /
          SUM(COUNT(DISTINCT order_id)) OVER ()
          * 100, 1)                   AS order_share_pct
FROM global_superstore
GROUP BY ship_mode
ORDER BY avg_days_to_ship;