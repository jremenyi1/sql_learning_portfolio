/*
File: order_by_limit_sorting_examples.sql
Purpose: Practice examples for ORDER BY, LIMIT, and basic filtering.
Week: 3
*/

-- --------------------------------------------------
-- Sort by salary (ascending)
-- --------------------------------------------------

SELECT
    last_name,
    salary
FROM f_staffs
ORDER BY salary;


-- --------------------------------------------------
-- Sort by salary (descending)
-- --------------------------------------------------

SELECT
    last_name,
    salary
FROM f_staffs
ORDER BY salary DESC;


-- --------------------------------------------------
-- Sort by department, then salary
-- --------------------------------------------------

SELECT
    department,
    last_name,
    salary
FROM f_staffs
ORDER BY department, salary DESC;


-- --------------------------------------------------
-- Limit results
-- --------------------------------------------------

SELECT
    first_name,
    last_name,
    salary
FROM f_staffs
LIMIT 5;


-- --------------------------------------------------
-- Filter with AND / OR
-- --------------------------------------------------

SELECT
    first_name,
    last_name,
    department,
    salary
FROM f_staffs
WHERE (department = 'Sales' OR department = 'Marketing')
AND salary > 10;

