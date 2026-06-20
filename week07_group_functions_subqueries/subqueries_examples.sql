/*
File: subqueries_examples.sql
Purpose: Practice examples demonstrating single-row, multiple-row,
and correlated subqueries.
Week: 7
*/

-- --------------------------------------------------------
-- Single-row subquery
-- Compare values using a single result from the subquery
-- --------------------------------------------------------

SELECT last_name, salary
FROM employees
WHERE salary >
(
    SELECT AVG(salary)
    FROM employees
);


-- --------------------------------------------------------
-- Single-row subquery using a value from another table
-- Find employees who work in the Marketing department
-- --------------------------------------------------------

SELECT last_name, job_id, department_id
FROM employees
WHERE department_id =
(
    SELECT department_id
    FROM departments
    WHERE department_name = 'Marketing'
);


-- --------------------------------------------------------
-- Multiple-row subquery using IN
-- Filter rows using a list of values returned by the subquery
-- --------------------------------------------------------

SELECT last_name, department_id
FROM employees
WHERE department_id IN
(
    SELECT department_id
    FROM departments
    WHERE location_id = 1700
);


-- --------------------------------------------------------
-- Multiple-row subquery using ANY
-- Compare a value to any value returned by the subquery
-- --------------------------------------------------------

SELECT last_name, salary
FROM employees
WHERE salary = ANY
(
    SELECT MIN(salary)
    FROM employees
    GROUP BY department_id
);


-- --------------------------------------------------------
-- Correlated subquery
-- Compare each employee's salary to the average salary
-- of their own department
-- --------------------------------------------------------

SELECT e.last_name, e.salary
FROM employees e
WHERE e.salary >
(
    SELECT AVG(i.salary)
    FROM employees i
    WHERE i.department_id = e.department_id
);


-- --------------------------------------------------------
-- Subquery in the HAVING clause
-- Compare grouped results to a value returned by a subquery
-- --------------------------------------------------------

SELECT department_id, MIN(salary)
FROM employees
GROUP BY department_id
HAVING MIN(salary) >
(
    SELECT MIN(salary)
    FROM employees
    WHERE department_id = 50
);


-- --------------------------------------------------------
-- Using EXISTS to test for related rows
-- Safer than NOT IN when NULL values may be present
-- --------------------------------------------------------

SELECT d.department_id, d.department_name
FROM departments d
WHERE EXISTS
(
    SELECT 1
    FROM employees e
    WHERE e.department_id = d.department_id
);