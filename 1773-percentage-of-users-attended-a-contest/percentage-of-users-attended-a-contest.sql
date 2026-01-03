# Write your MySQL query statement below
SELECT
    contest_id,
    ROUND((participant_per_contest * 100.0 ) / (SELECT COUNT(*) FROM Users), 2 ) AS percentage
FROM (
    SELECT
        contest_id,
        COUNT(user_id) AS participant_per_contest
    FROM Register
    GROUP BY contest_id
) AS temp_table
ORDER BY 
    percentage DESC,
    contest_id ASC