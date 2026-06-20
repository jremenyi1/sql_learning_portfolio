/*
============================================================
Week 7 — Submission Evidence (SQL Practice Tasks)
============================================================

Purpose:
This file contains SQL queries submitted for assessment
during Week 7 of my SQL learning programme.

Each section documents a single task, including the
objective and the logic applied. The focus is on
correctness, clarity, and understanding rather than
performance optimisation.

Environment:
- SQL dialect: Oracle SQL (Oracle APEX)
============================================================
*/

-- ---------------------------------------------------------
-- TASK 1: Employees earning above their department average
--         but below the company maximum

-- Notes:
-- Uses a correlated subquery to compare each employee
-- against the average salary of their own department.
-- A second subquery excludes the highest-paid employee(s)
-- in the company.
-- ---------------------------------------------------------

SELECT
    first_name,
    last_name,
    department_id,
    salary
FROM employees e
WHERE salary >
    (SELECT AVG(salary)
     FROM employees
     WHERE department_id = e.department_id)
AND salary <
    (SELECT MAX(salary)
     FROM employees);


-- ---------------------------------------------------------
-- TASK 2: Departments with consistently high salaries

-- Notes:
-- Groups employees by department and calculates both
-- minimum and average salaries per department.
-- The HAVING clause filters departments where the
-- lowest salary is still above the company-wide average.
-- ---------------------------------------------------------

SELECT
    department_id,
    MIN(salary) AS min_salary,
    AVG(salary) AS avg_salary
FROM employees
GROUP BY department_id
HAVING MIN(salary) >
    (SELECT AVG(salary)
     FROM employees);


-- ---------------------------------------------------------
-- TASK 3: Employees earning more than anyone in Sales
--         (single-value comparison)

-- Notes:
-- Uses nested subqueries to first identify the Sales
-- department, then find the maximum salary within it.
-- The outer query returns employees earning more
-- than that value.
-- ---------------------------------------------------------

SELECT
    first_name,
    last_name,
    salary,
    department_id
FROM employees
WHERE salary >
    (SELECT MAX(salary)
     FROM employees
     WHERE department_id =
         (SELECT department_id
          FROM departments
          WHERE department_name = 'Sales'));


-- ---------------------------------------------------------
-- TASK 3 (Alternative Solution): Employees earning more than
--                       all Sales employees

-- Notes:
-- Uses a multiple-row subquery with ALL.
-- This compares each salary against every salary
-- in the Sales department.
-- ---------------------------------------------------------

SELECT
    first_name,
    last_name,
    salary,
    department_id
FROM employees
WHERE salary > ALL
    (SELECT salary
     FROM employees
     WHERE department_id =
         (SELECT department_id
          FROM departments
          WHERE department_name = 'Sales'));