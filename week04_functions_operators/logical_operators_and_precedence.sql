/*
File: logical_operators_and_precedence.sql
Purpose: Show how logical operator order affects filtering results.
Week: 4
*/

-- --------------------------------------------------
-- Filter without brackets (default operator order)
-- --------------------------------------------------

SELECT
    first_name,
    last_name,
    department,
    salary
FROM f_staffs
WHERE department = 'Sales'
   OR department = 'Marketing'
  AND salary > 10;


-- --------------------------------------------------
-- Filter with brackets to make intent explicit
-- --------------------------------------------------

SELECT
    first_name,
    last_name,
    department,
    salary
FROM f_staffs
WHERE (department = 'Sales' OR department = 'Marketing')
  AND salary > 10;


-- --------------------------------------------------
-- Exclude a department using NOT
-- --------------------------------------------------

SELECT
    first_name,
    last_name,
    department
FROM f_staffs
WHERE NOT department = 'HR';