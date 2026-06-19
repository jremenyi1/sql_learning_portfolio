/*
File: join_examples.sql
Purpose: Practical examples of common SQL JOIN types.
Week: 6
Environment: Oracle SQL (Oracle APEX)

Notes:
- Joins allow us to combine related data from multiple tables.
- All examples use ANSI-99 JOIN syntax (recommended, portable, readable).
*/

-- --------------------------------------------------
-- CROSS JOIN
-- --------------------------------------------------
-- Combines every row from employees with every row from departments.
-- This creates a Cartesian product.
-- Use with care: result size grows very quickly.

SELECT
    last_name,
    department_name
FROM employees
CROSS JOIN departments;

-- Expected behaviour:
-- If employees has 20 rows and departments has 8 rows,
-- the result will contain 160 rows.


-- --------------------------------------------------
-- NATURAL JOIN
-- --------------------------------------------------
-- Automatically joins tables using columns with the same name
-- and compatible data types.
-- No ON clause is required.
-- Risky if column names change or match unintentionally.

SELECT
    department_id,
    department_name,
    city
FROM departments
NATURAL JOIN locations;

-- Notes:
-- departments and locations both contain location_id.
-- Oracle automatically joins on this column.


-- --------------------------------------------------
-- INNER JOIN
-- --------------------------------------------------
-- Returns only rows where a match exists in BOTH tables.
-- This is the most commonly used join.

SELECT
    e.last_name,
    d.department_name
FROM employees e
INNER JOIN departments d
ON e.department_id = d.department_id;

-- Notes:
-- Employees without a department are excluded.
-- Departments without employees are excluded.


-- --------------------------------------------------
-- LEFT OUTER JOIN
-- --------------------------------------------------
-- Returns all rows from the LEFT table,
-- even if no matching row exists in the RIGHT table.

SELECT
    e.last_name,
    d.department_name
FROM employees e
LEFT JOIN departments d
ON e.department_id = d.department_id;

-- Notes:
-- Employees without a department still appear.
-- department_name will be NULL where no match exists.


-- --------------------------------------------------
-- SELF JOIN
-- --------------------------------------------------
-- A table joined to itself.
-- Used to model hierarchical relationships
-- (e.g. employee → manager).

SELECT
    e.last_name AS employee,
    m.last_name AS manager
FROM employees e
LEFT JOIN employees m
ON e.manager_id = m.employee_id;

-- Notes:
-- The employees table is treated as two logical tables using aliases.
-- e = employee
-- m = manager
-- LEFT JOIN ensures top-level managers still appear.
-- Lightbulb moments:
-- Show every employee.
-- If they have a manager, show the manager’s name.
-- If they don’t, still show the employee


-- --------------------------------------------------
-- SUMMARY
-- --------------------------------------------------
-- `CROSS JOIN`   → all possible combinations
-- `NATURAL JOIN` → automatic join on same-named columns
-- `INNER JOIN`   → only matching rows
-- `LEFT JOIN`    → all left rows + matching right rows
-- `SELF JOIN`    → join a table to itself for hierarchies