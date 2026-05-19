/*
File: sorting_and_order_by_examples.sql
Purpose: Practice sorting results that include calculated columns.
Week: 4
*/

-- --------------------------------------------------
-- Sort by annual salary (calculated value)
-- --------------------------------------------------

SELECT
    last_name,
    salary,
    salary * 12 AS annual_salary
FROM f_staffs
ORDER BY annual_salary DESC;


-- --------------------------------------------------
-- Sort by department, then annual salary
-- --------------------------------------------------

SELECT
    department,
    last_name,
    salary * 12 AS annual_salary
FROM f_staffs
ORDER BY department ASC,
         annual_salary DESC;


-- --------------------------------------------------
-- Sort by revised salary after calculation
-- --------------------------------------------------

SELECT
    last_name,
    ROUND(salary * 1.1, 2) AS revised_salary
FROM f_staffs
ORDER BY revised_salary DESC;