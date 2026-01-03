SELECT
    table1.query_name,
    table1.quality,
    ROUND( COALESCE((poor_query / total) * 100, 0),
        2
    ) AS poor_query_percentage
FROM (
        SELECT
            query_name,
            ROUND(AVG(rating / position), 2) AS quality,
            COUNT(rating) AS total
        FROM Queries
        GROUP BY query_name 
) AS table1

LEFT JOIN 

(
        SELECT
            query_name,
            COUNT(rating) AS poor_query
        FROM Queries
        WHERE rating < 3
        GROUP BY query_name 
) AS table2
ON table2.query_name = table1.query_name