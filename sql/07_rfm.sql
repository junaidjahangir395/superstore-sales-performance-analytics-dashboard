WITH rfm_raw AS (
    SELECT
        customer_id,
        MAX(customer_name)            AS customer_name,
        MAX(segment)                  AS segment,
        DATEDIFF('2017-12-31',
            MAX(order_date))          AS recency_days,
        COUNT(DISTINCT order_id)      AS frequency,
        ROUND(SUM(sales), 2)          AS monetary
    FROM global_superstore
    GROUP BY customer_id
),
rfm_scores AS (
    SELECT *,
        NTILE(5) OVER (ORDER BY recency_days ASC)  AS r_score,
        NTILE(5) OVER (ORDER BY frequency    DESC) AS f_score,
        NTILE(5) OVER (ORDER BY monetary     DESC) AS m_score
    FROM rfm_raw
)
SELECT
    customer_id,
    customer_name,
    segment,
    recency_days,
    frequency,
    monetary,
    r_score, f_score, m_score,
    (r_score + f_score + m_score)     AS rfm_score,
    CASE
        WHEN r_score>=4 AND f_score>=4 AND m_score>=4 THEN 'Champions'
        WHEN r_score>=3 AND f_score>=3                THEN 'Loyal Customers'
        WHEN r_score>=4 AND f_score<=2                THEN 'New Customers'
        WHEN r_score<=2 AND f_score>=3 AND m_score>=3 THEN 'At Risk'
        WHEN r_score<=2 AND f_score<=2                THEN 'Lost'
        ELSE 'Potential Loyalists'
    END                               AS rfm_segment
FROM rfm_scores
ORDER BY rfm_score DESC;