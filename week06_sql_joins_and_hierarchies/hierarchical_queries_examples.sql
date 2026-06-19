/*
File: hierarchical_queries_examples.sql
Purpose: Practice examples using SELF JOIN concepts and Oracle hierarchical queries.
Week: 6
Environment: Oracle SQL (Oracle APEX)

Notes:
- These examples show how Oracle handles parent–child relationships.
- Hierarchical queries are an alternative to SELF JOINs when working with tree structures.
- Keywords used: START WITH, CONNECT BY, PRIOR, LEVEL
*/


-- -----------------------------------------------
-- BASIC HIERARCHY (TOP-DOWN)
-- -----------------------------------------------
-- This query starts at the top of the organisation
-- (employees with no manager) and walks down the tree.
-- LEVEL shows how deep each employee is in the hierarchy.

SELECT
    employee_id,
    last_name,
    manager_id,
    LEVEL
FROM employees
START WITH manager_id IS NULL
CONNECT BY PRIOR employee_id = manager_id;


-- -----------------------------------------------
-- ORG CHART STYLE OUTPUT (INDENTED)
-- -----------------------------------------------
-- This version formats the hierarchy visually.
-- LPAD is used to indent each employee based on LEVEL.
-- The higher the LEVEL, the deeper the indentation.

SELECT
    LPAD(
        last_name,
        LENGTH(last_name) + (LEVEL * 2) - 2,
        '-'
    ) AS org_chart
FROM employees
START WITH last_name = 'King'
CONNECT BY PRIOR employee_id = manager_id;


-- -----------------------------------------------
-- BOTTOM-UP HIERARCHY
-- -----------------------------------------------
-- This query works in reverse.
-- It starts from a specific employee and walks UP the hierarchy.
-- Moving PRIOR to the right side of the equals sign reverses the direction.

SELECT
    LPAD(
        last_name,
        LENGTH(last_name) + (LEVEL * 2) - 2,
        '-'
    ) AS org_chart
FROM employees
START WITH last_name = 'Grant'
CONNECT BY employee_id = PRIOR manager_id;


-- -----------------------------------------------
-- COMPARISON NOTE
-- -----------------------------------------------
-- SELF JOIN vs HIERARCHICAL QUERY
--
-- SELF JOIN:
-- - Joins the employees table to itself using aliases
-- - Shows only direct relationships (employee → manager)
--
-- HIERARCHICAL QUERY:
-- - Automatically walks the tree structure
-- - Can show full reporting chains in a single query
-- - LEVEL makes formatting and analysis much easier
--
-- For organisation charts and reporting structures,
-- CONNECT BY is clearer and more efficient than SELF JOINs.