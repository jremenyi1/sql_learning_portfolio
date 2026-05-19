/*
File: string_numeric_formatting_functions.sql
Purpose: Apply string and numeric functions to clean and format staff data.
Week: 4
*/

-- --------------------------------------------------
-- Standardise name casing
-- --------------------------------------------------

SELECT
    UPPER(last_name) AS last_name_upper,
    LOWER(first_name) AS first_name_lower
FROM f_staffs;


-- --------------------------------------------------
-- Extract part of a string
-- --------------------------------------------------

SELECT
    SUBSTR(last_name, 1, 3) AS last_name_prefix
FROM f_staffs;


-- --------------------------------------------------
-- Combine first and last names
-- --------------------------------------------------

SELECT
    first_name || ' ' || last_name AS full_name
FROM f_staffs;


-- --------------------------------------------------
-- Round salary values
-- --------------------------------------------------

SELECT
    salary,
    ROUND(salary, 2) AS rounded_salary
FROM f_staffs;


-- --------------------------------------------------
-- Calculate revised salary with uplift
-- --------------------------------------------------

SELECT
    salary,
    (salary * 1.1) + 250 AS revised_salary
FROM f_staffs;