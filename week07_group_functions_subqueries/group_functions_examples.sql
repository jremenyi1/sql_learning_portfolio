/*
File: group_functions_examples.sql
Purpose: Practice examples demonstrating SQL group functions and grouping logic.
Week: 7
*/

-- --------------------------------------------------------
-- Basic aggregation using a group function
-- Returns a single summary value for the whole table
-- --------------------------------------------------------

SELECT AVG(salary)
FROM employees;


-- --------------------------------------------------------
-- Counting non-null values in a column
-- COUNT (column) ignores NULL values by default
-- --------------------------------------------------------

SELECT COUNT(commission_pct)
FROM employees;


-- --------------------------------------------------------
-- Counting all rows, including those with NULL values
-- --------------------------------------------------------

SELECT COUNT(*)
FROM employees;


-- --------------------------------------------------------
-- Counting unique values using DISTINCT
-- Useful for identifying how many different job roles exist
-- --------------------------------------------------------

SELECT COUNT(DISTINCT job_id)
FROM employees;


-- --------------------------------------------------------
-- Replacing NULL values before aggregation
-- NVL ensures NULL commission values are treated as zero
-- --------------------------------------------------------

SELECT AVG(NVL(commission_pct, 0))
FROM employees;


-- --------------------------------------------------------
-- Grouping rows to calculate an average per department
-- Each department returns one aggregated result
-- --------------------------------------------------------

SELECT department_id, AVG(salary)
FROM employees
GROUP BY department_id;


-- --------------------------------------------------------
-- Using multiple group functions together
-- Shows minimum and maximum salary per department
-- --------------------------------------------------------

SELECT department_id,
       MIN(salary),
       MAX(salary)
FROM employees
GROUP BY department_id;


-- --------------------------------------------------------
-- Filtering grouped results using HAVING
-- HAVING is used instead of WHERE with group functions
-- --------------------------------------------------------

SELECT department_id, MIN(salary)
FROM employees
GROUP BY department_id
HAVING MIN(salary) > 5000;

