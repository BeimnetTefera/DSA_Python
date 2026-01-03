/* Write your T-SQL query statement below */
SELECT
    ROUND(
        100 * SUM( 
                    CASE
                        WHEN order_date = customer_pref_delivery_date THEN 1
                        ELSE 0
                    END
        ) / CAST(COUNT(*) AS FLOAT), 
    2) AS immediate_percentage
FROM(
    SELECT
        *,
        ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY order_date)AS FLAG
    FROM Delivery
) AS temp_table
WHERE FLAG = 1