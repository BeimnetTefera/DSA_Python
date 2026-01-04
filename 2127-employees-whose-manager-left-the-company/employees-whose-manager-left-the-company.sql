# Write your MySQL query statement below
SELECT
    e.employee_id
FROM Employees AS e
WHERE e.salary < 30000 AND
      e.manager_id IS NOT NULL AND 
      NOT EXISTS (SELECT employee_id FROM Employees AS m WHERE m.employee_id = e.manager_id)
ORDER BY employee_id ASC;