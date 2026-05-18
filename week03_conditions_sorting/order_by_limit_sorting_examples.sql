/*
File: order_by_and_sorting_examples.sql
Purpose: Demonstrate sorting query results using ORDER BY.

Focus:
- ascending vs descending order
- sorting by multiple columns
*/

------------------------------------------------------------
-- Task 1: Sort by salary (ascending)
------------------------------------------------------------

SELECT
    last_name,
    salary
FROM f_staffs
ORDER BY salary;


------------------------------------------------------------
-- Task 2: Sort by salary (descending)
------------------------------------------------------------

SELECT
    last_name,
    salary
FROM f_staffs
ORDER BY salary DESC;


------------------------------------------------------------
-- Task 3: Sort by department, then salary
------------------------------------------------------------

SELECT
    department,
    last_name,
    salary
FROM f_staffs
ORDER BY department, salary DESC;


------------------------------------------------------------
-- TASK 4
-- Limit results
------------------------------------------------------------

SELECT
    first_name,
    last_name,
    salary
FROM f_staffs
LIMIT 5;


------------------------------------------------------------
-- TASK 5
-- Logical conditions with brackets
------------------------------------------------------------

SELECT
    first_name,
    last_name,
    department,
    salary
FROM f_staffs
WHERE (department = 'Sales' OR department = 'Marketing')
AND salary > 10;


------------------------------------------------------------
-- TASK 6
-- Sorted output
------------------------------------------------------------

SELECT
    last_name,
    salary
FROM f_staffs
ORDER BY salary DESC;