/*
============================================================
 Week 6 — Additional Examples (SQL Joins & Hierarchies)

 Purpose:
 This file contains a small number of additional SQL examples
 included to strengthen evidence of understanding for joins
 covered in Week 6.

 The focus is on:
 - understanding WHY a join is used
 - explaining confusing concepts in plain English
 - showing practical, real-world use cases

 Environment:
 - SQL dialect: Oracle SQL
 - Platform: Oracle APEX
============================================================
*/

-- ----------------------------------------------------------
-- EXAMPLE 1: SELF JOIN — Employee to Manager relationship
-- ----------------------------------------------------------
-- Lightbulb moment:
-- The employees table is used twice with different aliases.
-- One row represents the employee, the other represents their manager.
--
-- The link between them is manager_id.
-- manager_id stores the employee_id of the manager.
--
-- By joining the employees table to itself and using aliases:
--   e = employee
--   m = manager
--
-- SQL can match each employee to the row that represents
-- their manager.

SELECT
    e.first_name AS "Employee First Name",
    e.last_name AS "Employee Last Name",
    m.first_name AS "Manager First Name",
    m.last_name AS "Manager Last Name",
    e.job_id AS "Job ID",
    e.salary AS "Employee Salary"
FROM employees e
JOIN employees m
    ON e.manager_id = m.employee_id
WHERE e.manager_id IS NOT NULL
ORDER BY
    m.last_name ASC,
    e.salary DESC;

-- ----------------------------------------------------------
-- EXAMPLE 2: LEFT OUTER JOIN — Employees without departments
-- ----------------------------------------------------------
-- Lightbulb moment:
-- INNER JOIN only shows records that exist in BOTH tables.
-- That means employees without a department would disappear.
--
-- A LEFT JOIN keeps ALL employees and only adds department
-- data when it exists.
--
-- If there is no matching department, the department
-- columns show NULL instead of removing the employee.

SELECT
    e.first_name || ' ' || e.last_name AS "Employee Name",
    e.job_id,
    e.salary,
    d.department_name
FROM employees e
LEFT JOIN departments d
    ON e.department_id = d.department_id
ORDER BY
    d.department_name NULLS LAST,
    e.salary DESC;

-- ----------------------------------------------------------
-- EXAMPLE 3: HIERARCHICAL QUERY — Organisation structure
-- ----------------------------------------------------------
-- Lightbulb moment:
-- A self-join only shows one level (employee -> manager).
-- Hierarchical queries allow SQL to walk through the FULL
-- reporting structure automatically.
--
-- START WITH defines the top of the hierarchy.
-- CONNECT BY PRIOR tells Oracle how rows are linked.
-- LEVEL shows how deep each employee is in the structure.
--
-- LPAD is used here to visually indent names so the
-- hierarchy is easy to read.

SELECT
    LPAD(' ', (LEVEL - 1) * 3) || first_name || ' ' || last_name
        AS "Employee Hierarchy",
    job_id,
    salary,
    LEVEL AS "Hierarchy Level"
FROM employees
START WITH manager_id IS NULL
CONNECT BY PRIOR employee_id = manager_id
ORDER BY LEVEL, last_name;