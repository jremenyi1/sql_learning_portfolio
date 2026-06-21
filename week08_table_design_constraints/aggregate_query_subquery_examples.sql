/*
File: aggregate_examples.sql
Purpose: Practice examples demonstrating aggregate
         functions, GROUP BY, HAVING, and subqueries.
Week: 8
*/

------------------------------------------------------------
-- Basic aggregate functions
-- Calculate summary values across rows
------------------------------------------------------------

-- Company-wide average salary

SELECT AVG(salary) AS company_avg_salary
FROM employees;


------------------------------------------------------------
-- Basic aggregate functions
-- Calculate minimum and maximum values across rows
------------------------------------------------------------

-- Min and max salary

SELECT MIN(salary) AS min_salary,
       MAX(salary) AS max_salary
FROM employees;


------------------------------------------------------------
-- Aggregates with GROUP BY
-- Calculate values per department
------------------------------------------------------------

-- Average salary per department

SELECT department_id,
       AVG(salary) AS dept_avg_salary
FROM employees
GROUP BY department_id;


-----------------------------------------------------------
-- Aggregate comparison using a correlated subquery
-- Compare each row to a grouped value
------------------------------------------------------------

-- Employees earning more than the average
-- salary in their own department

SELECT
    e.employee_id,
    e.department_id,
    e.salary
FROM employees e
WHERE e.salary >
(
    SELECT AVG(i.salary)
    FROM employees i
    WHERE i.department_id = e.department_id
);


------------------------------------------------------------
-- Aggregate comparison using a scalar subquery
-- Exclude extreme values from results
------------------------------------------------------------

-- Employees earning less than the maximum
-- salary in the company

SELECT employee_id, salary
FROM employees
WHERE salary < (
    SELECT MAX(salary)
    FROM employees
);


------------------------------------------------------------
-- Aggregates with GROUP BY and HAVING
-- Filter results after aggregation
------------------------------------------------------------

-- Departments where the minimum salary
-- is higher than the company-wide average

SELECT
    department_id,
    MIN(salary) AS dept_min_salary
FROM department_salaries
GROUP BY department_id
HAVING MIN(salary) >
(
    SELECT AVG(salary)
    FROM department_salaries
);


------------------------------------------------------------
-- Notes:
-- Aggregate functions summarise data across rows.
-- GROUP BY controls the level of aggregation.
-- HAVING filters aggregated results, not raw rows.
-- Subqueries allow meaningful comparisons
-- between individual values and grouped data.
------------------------------------------------------------
