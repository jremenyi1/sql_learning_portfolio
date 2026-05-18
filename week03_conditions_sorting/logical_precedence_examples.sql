
/*
File: logical_precedence_examples.sql
Purpose: Demonstrate how logical operator precedence affects query results.

Key idea:
SQL evaluates NOT, then AND, then OR.
Brackets are used to control evaluation order.
*/

------------------------------------------------------------
-- Task 1: AND evaluated before OR
-- Business rule (incorrectly expressed):
-- Return Sales or Marketing staff earning more than 10
------------------------------------------------------------

SELECT *
FROM f_staffs
WHERE department = 'Sales'
OR department = 'Marketing'
AND salary > 10;


------------------------------------------------------------
-- Task 2: Correct use of brackets
-- Business rule:
-- Return staff in Sales or Marketing
-- who earn more than 10
------------------------------------------------------------

SELECT *
FROM f_staffs
WHERE (department = 'Sales' OR department = 'Marketing')
AND salary > 10;


------------------------------------------------------------
-- Task 3: Using NOT
-- Business rule:
-- Exclude HR staff
------------------------------------------------------------

SELECT *
FROM f_staffs
WHERE NOT department = 'HR';