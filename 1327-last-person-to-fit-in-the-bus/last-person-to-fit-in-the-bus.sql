# Write your MySQL query statement below
SELECT 
    person_name
FROM(
    SELECT
        *,
        SUM(weight) OVER(ORDER BY turn ASC
                    ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS total_weight
    FROM Queue
) AS temp_table
WHERE total_weight <= 1000
ORDER BY total_weight DESC
LIMIT 1;