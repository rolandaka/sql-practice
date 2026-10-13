sql
--- Problem: Determine the second highest salary among all employees
--- Source: https://datalemur.com/questions/sql-second-highest-salary
--- Difficulty: Medium
--- Approach: Use CTE to create a temporary highest salary table then nest it in the where clause in the main select statement
WITH highest_salary_cte AS (
  SELECT MAX(salary) AS highest_salary
  FROM employee
)

SELECT MAX(salary) AS second_highest_salary
FROM employee
WHERE salary < (
    SELECT highest_salary
    FROM highest_salary_cte 
);
