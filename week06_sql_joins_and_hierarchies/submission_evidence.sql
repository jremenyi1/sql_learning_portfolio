/*
============================================================
 Week 6 — Submission Evidence (SQL Joins & Self-Joins)

 Purpose:
 This file contains SQL queries submitted for Week 6 assessment.

 Each task includes:
 - the business requirement
 - the SQL logic used to solve it
 - notes where relevant (e.g. no results returned)

 Environment:
 - SQL dialect: Oracle SQL
 - Tool: Oracle APEX
============================================================
*/

-- ----------------------------------------------------------
-- TASK 1: Employee and Department Join Analysis Report
-- ----------------------------------------------------------
 
-- Business requirement:
-- Produce a report combining employees and departments.
-- Show full name, department name, salary, hire date,
-- revised salary (+8%), and a department bonus.
-- Bonus rule:
--   £300 if department_id = 30, otherwise £0
-- Filters:
--   - departments 10, 20, 30
--   - salary > 4000
--   - hired after 01-JAN-2016
-- Sorting:
--   - revised salary DESC
--   - department name ASC

-- Notes:
-- No rows returned because:
-- - there are no employees in department 30
-- - there are no employees hired after 01-JAN-2016
-- Currency formatting required explicit NLS_CURRENCY
-- to force GBP in Oracle APEX.

-- ----------------------------------------------------------

SELECT
    e.first_name || ' ' || e.last_name AS "Full Name",
    d.department_name AS "Department Name",
    e.salary AS "Salary",
    TO_CHAR(e.hire_date, 'DD-Mon-YYYY') AS "Hire Date",
    e.salary * 1.08 AS "Revised Salary",
    TO_CHAR(
        NVL(
            CASE
                WHEN d.department_id = 30 THEN 300
                ELSE 0
            END,
        0),
        'FML999,999',
        'NLS_CURRENCY=''£'''
    ) AS "Department Bonus"
FROM employees e
INNER JOIN departments d
    ON e.department_id = d.department_id
WHERE d.department_id IN (10, 20, 30)
  AND e.salary > 4000
  AND e.hire_date > '01-Jan-2016'
ORDER BY
    "Revised Salary" DESC,
    "Department Name" ASC;

-- ----------------------------------------------------------
-- TASK 2: Employee Manager Hierarchy and Salary Report
-- ----------------------------------------------------------

-- Business requirement:
-- Produce a structured report showing employees
-- alongside their managers using a SELF JOIN.
-- Display:
--   - employee first & last name
--   - manager first & last name
--   - job ID
--   - salary
--   - manager bonus
-- Bonus rule:
--   £200 if employee salary < 5000, otherwise £0
-- Filters:
--   - job_id starts with 'SA_'
--   - salary > 3500
--   - employee must have a manager
-- Sorting:
--   - manager last name ASC
--   - employee salary DESC

-- Notes:
-- Self-join links employee.manager_id to manager.employee_id
-- NVL used to prevent NULL bonus values
-- Currency formatted explicitly as GBP

-- ----------------------------------------------------------

SELECT
    e.first_name AS "Employee First Name",
    e.last_name AS "Employee Last Name",
    m.first_name AS "Manager First Name",
    m.last_name AS "Manager Last Name",
    e.job_id AS "Job ID",
    e.salary AS "Employee Salary",
    TO_CHAR(
        NVL(
            CASE
                WHEN e.salary < 5000 THEN 200
                ELSE 0
            END,
        0),
        'FML999,999',
        'NLS_CURRENCY=''£'''
    ) AS "Manager Bonus"
FROM employees e
JOIN employees m
    ON e.manager_id = m.employee_id
WHERE e.job_id LIKE 'SA_%'
  AND e.salary > 3500
  AND m.last_name != '0'
ORDER BY
    "Manager Last Name" ASC,
    "Employee Salary" DESC;
