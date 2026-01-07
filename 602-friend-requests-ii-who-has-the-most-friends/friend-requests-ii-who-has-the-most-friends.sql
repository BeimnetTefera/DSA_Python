# Write your MySQL query statement below
SELECT
    id,
    COUNT(*) AS num
FROM(
    SELECT 
        accepter_id AS id
    FROM RequestAccepted 

    UNION ALL

    SELECT 
        requester_id AS id
    FROM RequestAccepted 
) AS temp_table
GROUP BY id
ORDER BY COUNT(*) DESC
LIMIT 1;