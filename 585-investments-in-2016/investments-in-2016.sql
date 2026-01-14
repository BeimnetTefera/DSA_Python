# Write your MySQL query statement below
SELECT
    ROUND(
        SUM(table_1.tiv_2016)
        , 2) AS tiv_2016
FROM
(
    SELECT 
        *,
        COUNT(*) OVER (PARTITION BY tiv_2015)AS total_people,
        COUNT(tiv_2016) OVER(PARTITION BY lat, lon)AS total
    FROM Insurance
) AS table_1
WHERE total = 1 AND total_people > 1