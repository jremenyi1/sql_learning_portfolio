/*
============================================================
Week 4 — Submission Evidence (SQL Functions and Operators)
============================================================

Purpose:
This file contains SQL queries submitted for assessment
during Week 4 of my SQL learning programme.

Each task applies SQL functions, operators, and sorting
to prepare data directly within the query.

Environment:
- SQL dialect: Oracle SQL (Oracle APEX)
============================================================
*/

-- --------------------------------------------------
-- TASK 1: Employee compensation and tenure report
--
-- Objective:
-- Show employee name, salary, hire date, and revised salary
--
-- Business rules:
-- - Increase salary by 10%
-- - Add a fixed adjustment of 250
-- - Include salaries between 4000 and 9000
-- - Include employees hired after 01-JAN-2017
-- - Include only last names starting with 'S'
-- - Sort by revised salary (descending)
-- - Then by hire date (ascending)
--
-- Notes:
-- No records met all filter conditions in this dataset
-- --------------------------------------------------

SELECT
    first_name || ' ' || last_name AS employee_full_name,
    salary,
    hire_date,
    (salary * 1.1) + 250 AS revised_salary
FROM employees
WHERE salary BETWEEN 4000 AND 9000
  AND hire_date > TO_DATE('01-JAN-2017', 'DD-MON-YYYY')
  AND last_name LIKE 'S%'
ORDER BY revised_salary DESC,
         hire_date ASC;


-- --------------------------------------------------
-- TASK 2: Department salary and role analysis
--
-- Objective:
-- Review salary levels across selected departments
--
-- Business rules:
-- - Include departments 20, 30, and 50
-- - Exclude managerial roles
-- - Include salaries greater than 4500
-- - Format employee ID with leading zeros
-- - Calculate annual salary
-- - Sort by annual salary (descending)
-- - Then by department ID (ascending)
-- --------------------------------------------------

SELECT
    LPAD(employee_id, 5, '0') AS employee_id_formatted,
    job_id,
    department_id,
    salary,
    salary * 12 AS annual_salary
FROM employees
WHERE department_id IN (20, 30, 50)
  AND job_id NOT LIKE 'MAN%'
  AND salary > 4500
ORDER BY annual_salary DESC,
         department_id ASC;


-- --------------------------------------------------
-- TASK 3: Employee contact and commission review
--
-- Objective:
-- Identify employees without commission records
--
-- Business rules:
-- - Include only NULL commission values
-- - Include phone numbers containing '555'
-- - Include salaries greater than 3500
-- - Display last names in uppercase
-- - Sort by salary (descending)
-- - Then by last name (ascending)
-- --------------------------------------------------

SELECT
    first_name,
    UPPER(last_name) AS last_name_upper,
    phone_number,
    commission_pct,
    salary
FROM employees
WHERE commission_pct IS NULL
  AND phone_number LIKE '%555%'
  AND salary > 3500
ORDER BY salary DESC,
         last_name_upper ASC;