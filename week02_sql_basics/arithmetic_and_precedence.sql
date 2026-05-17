/*
File: arithmetic_and_precedence.sql
Purpose: Demonstrate correct use of arithmetic operations and operator precedence in SQL.

Key idea:
Brackets are used to control the order of calculations so results match real-world business rules.
*/

------------------------------------------------------------
-- Task 1: Bonus added before tax
-- Business rule:
-- Add a fixed bonus first, then apply tax.
------------------------------------------------------------

SELECT
    last_name,
    (salary + 2.00) * 0.90 AS adjusted_salary
FROM f_staffs;


------------------------------------------------------------
-- Task 2: Percentage increase before fixed deduction
-- Business rule:
-- Apply percentage increase first, then subtract a fixed amount.
------------------------------------------------------------

SELECT
    last_name,
    (salary * 1.12) - 1.50 AS updated_salary
FROM f_staffs;


------------------------------------------------------------
-- Task 3: Overtime calculation
-- Business rule:
-- Multiply base salary for overtime rate, then add a fixed incentive.
------------------------------------------------------------

SELECT
    last_name,
    (salary * 1.5) + 3.00 AS overtime_pay
FROM f_staffs;


------------------------------------------------------------
-- Task 4: Service charge added before discount
-- Business rule:
-- Add a fixed service charge first, then apply a percentage discount.
------------------------------------------------------------

SELECT
    id,
    (cost + 100) * 0.95 AS final_cost
FROM d_events;