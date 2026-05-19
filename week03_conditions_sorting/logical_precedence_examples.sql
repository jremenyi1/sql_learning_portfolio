
/*
File: logical_precedence_examples.sql
Purpose: Practice examples demonstrating logical operator precedence in SQL.
Week: 3
*/

-- --------------------------------------------------
-- AND evaluated before OR (default behaviour)
-- --------------------------------------------------

SELECT *
FROM f_staffs
WHERE department = 'Sales'
OR department = 'Marketing'
AND salary > 10;


-- --------------------------------------------------
-- Correct use of brackets for controlled logic
-- --------------------------------------------------

SELECT *
FROM f_staffs
WHERE (department = 'Sales' OR department = 'Marketing')
AND salary > 10;


-- --------------------------------------------------
-- Using NOT to exclude values
-- --------------------------------------------------

SELECT *
FROM f_staffs
WHERE NOT department = 'HR';