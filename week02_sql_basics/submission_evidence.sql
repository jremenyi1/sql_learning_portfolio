/*
============================================================
Week 2 — Submission Evidence (SQL Practice Tasks)
============================================================

Purpose:
This file contains SQL queries submitted for assessment
during Week 2 of my SQL learning programme.

Each section documents a single task, including the
objective and the business logic applied. The emphasis
is on correctness, clarity, and traceability rather than
performance optimisation.

Environment:
- SQL dialect: Oracle SQL (Oracle APEX)
============================================================
*/

-- --------------------------------------------------
-- TASK 1: Staff salary filtering
--
-- Objective:
-- Return staff whose salary is between 8 and 15
--
-- Business rules:
-- - Only include staff within the specified salary range
-- --------------------------------------------------

SELECT
    first_name,
    last_name,
    salary AS "Hourly Rate"
FROM f_staffs
WHERE salary > 8
  AND salary < 15;


-- --------------------------------------------------
-- TASK 2: CD catalogue filtering
--
-- Objective:
-- Return distinct CD titles released before 2005
--
-- Business rules:
-- - Only include CDs released before 2005
-- - Remove duplicate titles
-- --------------------------------------------------

SELECT DISTINCT
    title,
    year
FROM d_cds
WHERE year < 2005;


-- --------------------------------------------------
-- TASK 3: Salary adjustment with condition
--
-- Objective:
-- Apply a salary increase and bonus, then filter results
--
-- Business rules:
-- - Increase salary by 10%
-- - Add fixed bonus of 1
-- - Only return results below 20 after calculation
-- --------------------------------------------------

SELECT
    last_name,
    salary,
    (salary * 1.1) + 1 AS "Updated Salary"
FROM f_staffs
WHERE (salary * 1.1) + 1 < 20;


-- --------------------------------------------------
-- TASK 4: Event cost calculation with tax
--
-- Objective:
-- Calculate event cost after service fee and tax
--
-- Business rules:
-- - Add fixed service fee of 100
-- - Apply 10% tax to adjusted cost
-- --------------------------------------------------

SELECT
    id,
    name,
    (cost + 100) * 1.1 AS "Correct Cost"
FROM d_events;


-- --------------------------------------------------
-- TASK 5: Partner expense adjustment
--
-- Objective:
-- Apply increase and bonus to authorised expenses
--
-- Business rules:
-- - Increase authorised expense by 5%
-- - Add fixed bonus of 200
-- --------------------------------------------------

SELECT
    first_name,
    last_name,
    (auth_expense_amt * 1.05) + 200 AS "Correct Partner Expenses"
FROM d_partners;


-- --------------------------------------------------
-- TASK 6: Event cost adjustment with discount
--
-- Objective:
-- Apply increase and discount to event cost
--
-- Business rules:
-- - Increase cost by 12%
-- - Subtract fixed discount of 50
-- --------------------------------------------------

SELECT
    id,
    name,
    (cost * 1.12) - 50 AS "Final Event Cost"
FROM d_events;