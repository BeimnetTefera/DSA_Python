/* Write your T-SQL query statement below */

SELECT
    pr.product_id,
    COALESCE(
        ROUND(
            CAST(SUM(pr.price * units) AS FLOAT ) / SUM(us.units), 2), 0) AS average_price
FROM Prices AS pr
LEFT JOIN UnitsSold AS us
ON pr.product_id = us.product_id
AND us.purchase_date BETWEEN pr.start_date AND pr.end_date
GROUP BY pr.product_id;