/*
File: conditional_expressions_examples.sql
Purpose: Examples comparing CASE and DECODE.
Week: 5
*/

-- --------------------------------------------------
-- DECODE: simple value-to-value mapping
-- --------------------------------------------------

SELECT
    department_id,
    DECODE(
        department_id,
        10, 'HR',
        20, 'IT',
        'Other'
    ) AS department_name
FROM employees;


-- --------------------------------------------------
-- DECODE: recoding fixed values
-- --------------------------------------------------

SELECT
    duration,
    DECODE(
        duration,
        '2 min', 'shortest',
        '10 min', 'longest',
        duration
    ) AS duration_label
FROM d_songs;


-- --------------------------------------------------
-- CASE (simple): standard alternative to DECODE
-- --------------------------------------------------

SELECT
    status,
    CASE status
        WHEN 'A' THEN 'Active'
        WHEN 'I' THEN 'Inactive'
        ELSE 'Unknown'
    END AS status_description
FROM accounts;


-- --------------------------------------------------
-- CASE (searched): handle ranges and conditions
-- --------------------------------------------------

SELECT
    salary,
    CASE
        WHEN salary > 100000 THEN 'High'
        WHEN salary BETWEEN 50000 AND 100000 THEN 'Medium'
        ELSE 'Low'
    END AS salary_band
FROM employees;


-- --------------------------------------------------
-- CASE: conditional salary adjustment
-- --------------------------------------------------

SELECT
    last_name,
    department_id,
    salary,
    CASE
        WHEN department_id = 10 THEN salary * 1.25
        WHEN department_id = 90 THEN salary * 1.50
        ELSE salary
    END AS adjusted_salary
FROM employees;


-- --------------------------------------------------
-- CASE vs DECODE: CASE handles NULL properly
-- --------------------------------------------------

SELECT
    commission_pct,
    CASE
        WHEN commission_pct IS NULL THEN 'No Commission'
        ELSE 'Commission Paid'
    END AS commission_status
FROM employees;