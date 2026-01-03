SELECT
    ROUND(
        COUNT(*) * 1.0 / (SELECT COUNT(DISTINCT player_id) FROM Activity),
        2
    ) AS fraction
FROM (
    SELECT
        player_id
    FROM (
        SELECT
            player_id,
            event_date,
            LEAD(event_date) OVER (
                PARTITION BY player_id
                ORDER BY event_date
            ) AS next_event
        FROM Activity
    ) t
    WHERE DATEDIFF(day, event_date, next_event) = 1
      AND event_date = (
            SELECT MIN(a2.event_date)
            FROM Activity a2
            WHERE a2.player_id = t.player_id
      )
) x;
