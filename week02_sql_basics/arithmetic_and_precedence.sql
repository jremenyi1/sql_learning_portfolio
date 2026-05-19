/*
File: arithmetic_and_precedence.sql
Purpose: Practice examples for arithmetic operations and operator precedence in SQL.
Week: 2
*/

-- --------------------------------------------------
-- Bonus added before tax
-- --------------------------------------------------

SELECT
    last_name,
    (salary + 2.00) * 0.90 AS adjusted_salary
FROM f_staffs;


-- --------------------------------------------------
-- Percentage increase before fixed deduction
-- --------------------------------------------------

SELECT
    last_name,
    (salary * 1.12) - 1.50 AS updated_salary
FROM f_staffs;


-- --------------------------------------------------
-- Overtime calculation
-- --------------------------------------------------

SELECT
    last_name,
    (salary * 1.5) + 3.00 AS overtime_pay
FROM f_staffs;


-- --------------------------------------------------
-- Service charge added before discount
-- --------------------------------------------------

SELECT
    id,
    (cost + 100) * 0.95 AS final_cost
FROM d_events;