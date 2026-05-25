/*
File: conversion_and_null_functions_examples.sql
Purpose: Practical examples using conversion and NULL-related functions.
Week: 5
*/

-- --------------------------------------------------
-- TO_CHAR: format numeric values as currency
-- --------------------------------------------------

SELECT
    last_name,
    overtime_rate,
    TO_CHAR(overtime_rate, 'FML9,999.99') AS overtime_rate_currency
FROM f_staffs;


-- --------------------------------------------------
-- TO_CHAR: format dates for readable output
-- --------------------------------------------------

SELECT
    hire_date,
    TO_CHAR(hire_date, 'DD-MON-YYYY') AS formatted_hire_date
FROM employees;


-- --------------------------------------------------
-- TO_CHAR: display month name (clean output using FM)
-- --------------------------------------------------

SELECT
    hire_date,
    TO_CHAR(hire_date, 'FMMonth') AS hire_month
FROM employees;


-- --------------------------------------------------
-- TO_NUMBER: convert character data to numeric
-- --------------------------------------------------

SELECT
    manager_id,
    TO_NUMBER(manager_id) AS manager_id_number
FROM f_staffs;


-- --------------------------------------------------
-- TO_DATE: convert a string into an Oracle DATE
-- --------------------------------------------------

SELECT
    TO_DATE('15-03-2024', 'DD-MM-YYYY') AS converted_date
FROM dual;


-- --------------------------------------------------
-- NVL: replace NULL with a default value
-- --------------------------------------------------

SELECT
    last_name,
    NVL(manager_id, 9999) AS manager_id_cleaned
FROM f_staffs;


-- --------------------------------------------------
-- NVL: replace NULL overtime_rate and format result
-- --------------------------------------------------

SELECT
    overtime_rate,
    TO_CHAR(
        NVL(overtime_rate, 5),
        'FM$9999.99'
    ) AS overtime_rate_cleaned
FROM f_staffs;


-- --------------------------------------------------
-- NVL: replace missing text values
-- --------------------------------------------------

SELECT
    first_name,
    NVL(specialty, 'No Specialty') AS specialty
FROM d_partners;


-- --------------------------------------------------
-- NVL2: return different values based on NULL
-- --------------------------------------------------

SELECT
    end_date,
    NVL2(end_date, 'Ends Soon', SYSDATE) AS end_date_status
FROM f_promotional_menus;


-- --------------------------------------------------
-- COALESCE: return the first non-NULL value
-- --------------------------------------------------

SELECT
    manager_id,
    department_id,
    COALESCE(manager_id, department_id) AS first_non_null_value
FROM f_staffs;


-- --------------------------------------------------
-- NULLIF: return NULL when values match
-- --------------------------------------------------

SELECT
    department_id,
    NULLIF(department_id, 90) AS converted_department_id
FROM employees;


-- --------------------------------------------------
-- NULLIF: hide specific text values
-- --------------------------------------------------

SELECT
    first_name,
    specialty,
    NULLIF(specialty, 'DJ') AS null_specialty
FROM d_partners;


-- --------------------------------------------------
-- Combining functions: NULL handling with formatting
-- --------------------------------------------------

SELECT
    overtime_rate,
    TO_CHAR(
        NVL(overtime_rate, 0),
        'FM9999.99'
    ) AS overtime_rate_formatted
FROM f_staffs;


-- --------------------------------------------------
-- TO_CHAR + NULLIF: suppress a specific month
-- --------------------------------------------------

SELECT
    first_name || ' ' || last_name AS full_name,
    NULLIF(
        TO_CHAR(hire_date, 'FMMonth'),
        'September'
    ) AS hire_month
FROM employees;