/*
============================================================
Week 5 — Submission Evidence (SQL Practice Tasks)
============================================================

Purpose:
This file contains SQL queries submitted for Week 5 assessment.

Each task includes:
- the business requirement
- the SQL logic used to solve it
- notes where relevant (e.g. no results returned)

Environment:
- SQL dialect: Oracle SQL (Oracle APEX)
============================================================
*/


-- --------------------------------------------------
-- TASK 1: Employee compensation, tenure and bonus report
--
-- Objective:
-- Build an employee report showing:
-- - full name
-- - salary
-- - formatted hire date
-- - revised salary (10% increase + £250)
-- - bonus based on salary band
--
-- Business rules:
-- - Salary between 4000 and 9000
-- - Hire date after 01-JAN-2017
-- - Last name starts with 'S'
-- - Bonus: £500 if salary < 5000, otherwise £0
-- - Sort by revised salary (DESC), hire date (ASC)
--
-- Notes:
-- No output returned due to strict filters
-- --------------------------------------------------

SELECT
    first_name || ' ' || last_name AS "Full Name",
    salary,
    TO_CHAR(hire_date, 'DD-Mon-YYYY') AS formatted_hire_date,
    (salary * 1.10) + 250 AS "Revised Salary",
    NVL(
        CASE
            WHEN salary < 5000 THEN 500
            ELSE 0
        END,
    0) AS "Bonus"
FROM employees
WHERE salary BETWEEN 4000 AND 9000
  AND hire_date > TO_DATE('01-JAN-2017', 'DD-MON-YYYY')
  AND last_name LIKE 'S%'
ORDER BY
    "Revised Salary" DESC,
    hire_date ASC;


-- --------------------------------------------------
-- TASK 2: Department salary and annual projection report
--
-- Objective:
-- Produce a salary analysis report including:
-- - formatted employee ID
-- - job and department details
-- - monthly and annual salary
-- - adjusted salary for department rules
--
-- Business rules:
-- - Departments 20, 30, 50 only
-- - Exclude job IDs starting with 'MAN'
-- - Salary > 4500 only
-- - Department 50 gets +£1000 adjustment
-- - Format numeric output for readability
--
-- Notes:
-- Uses NVL2 with CASE for conditional adjustment
-- --------------------------------------------------

SELECT
    TO_CHAR(employee_id, 'FM00000') AS employee_id,
    job_id,
    department_id,
    TO_CHAR(salary, 'FM999,999.00') AS "Monthly Salary",
    TO_CHAR(salary * 12, 'FM999,999.00') AS "Annual Salary",
    TO_CHAR(
        NVL2(
            salary,
            CASE
                WHEN department_id = 50 THEN salary + 1000
                ELSE salary
            END,
            NULL
        ),
        'FM999,999.00'
    ) AS "Adjusted Salary"
FROM employees
WHERE department_id IN (20, 30, 50)
  AND job_id NOT LIKE 'MAN%'
  AND salary > 4500
ORDER BY
    "Annual Salary" DESC,
    department_id ASC;


-- --------------------------------------------------
-- TASK 3: Employee contact and commission eligibility report
--
-- Objective:
-- Create a contact report with eligibility logic:
-- - uppercase names
-- - commission handling
-- - salary formatting
-- - eligibility flag
--
-- Business rules:
-- - Phone number must contain '555'
-- - Commission NULL treated as 0
-- - Eligible if commission is NULL AND salary > 3500
-- - Otherwise Not Eligible
--
-- Notes:
-- Uses DECODE with NULLIF logic for eligibility flag
-- --------------------------------------------------

SELECT
    UPPER(first_name) AS first_name,
    UPPER(last_name) AS last_name,
    phone_number,
    COALESCE(commission_pct, 0) AS commission_pct,
    TO_CHAR(salary, 'FM99999.00') AS salary,
    DECODE(
        NULLIF(commission_pct, commission_pct),
        NULL,
        CASE
            WHEN salary > 3500 THEN 'Eligible'
            ELSE 'Not Eligible'
        END,
        'Not Eligible'
    ) AS eligibility
FROM employees
WHERE phone_number LIKE '%555%'
ORDER BY
    salary DESC,
    last_name ASC;