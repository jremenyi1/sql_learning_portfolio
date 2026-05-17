/*
============================================================
Week 2 - Submission Evidence (SQL Practice Tasks)
============================================================

This file contains all SQL queries submitted for assessment.
Each section is labelled clearly for readability.
============================================================
*/

------------------------------------------------------------
-- OLD TASK 1
-- Filtering and formatting staff salaries
------------------------------------------------------------

SELECT
    first_name,
    last_name,
    salary AS "Hourly Rate"
FROM f_staffs
WHERE salary > 8 AND salary < 15;


------------------------------------------------------------
-- OLD TASK 2
-- Distinct CD titles before 2005
------------------------------------------------------------

SELECT DISTINCT
    title,
    year
FROM d_cds
WHERE year < 2005;


------------------------------------------------------------
-- OLD TASK 3
-- Salary increase + bonus with condition
------------------------------------------------------------

SELECT
    last_name,
    salary,
    (salary * 1.1) + 1 AS "Updated Salary"
FROM f_staffs
WHERE ((salary * 1.1) + 1) < 20;


------------------------------------------------------------
-- NEW TASK 1
-- Event cost with service fee + tax
------------------------------------------------------------

SELECT
    id,
    name,
    (cost + 100) * 1.1 AS "Correct Cost"
FROM d_events;


------------------------------------------------------------
-- NEW TASK 2
-- Partner expenses: increase then bonus
------------------------------------------------------------

SELECT
    first_name,
    last_name,
    (auth_expense_amt * 1.05) + 200 AS "Correct Partner Expenses"
FROM d_partners;


------------------------------------------------------------
-- NEW TASK 3
-- Event cost increase + discount
------------------------------------------------------------

SELECT
    id,
    name,
    (cost * 1.12) - 50 AS "Final Event Cost"
FROM d_events;