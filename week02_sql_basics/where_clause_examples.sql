/*
File: where_clause_examples.sql
Purpose: Practice examples for filtering data using the WHERE clause.
Week: 2
*/

-- --------------------------------------------------
-- Text filtering using LIKE
-- --------------------------------------------------

SELECT
    first_name,
    last_name
FROM d_clients
WHERE last_name LIKE 'S%';


-- --------------------------------------------------
-- Numeric comparison
-- --------------------------------------------------

SELECT
    id
FROM d_events
WHERE cost < 1000;


-- --------------------------------------------------
-- Range filtering using BETWEEN
-- --------------------------------------------------

SELECT
    id
FROM d_events
WHERE cost BETWEEN 500 AND 2000;


-- --------------------------------------------------
-- Filtering using IN
-- --------------------------------------------------

SELECT
    first_name,
    last_name
FROM d_partners
WHERE partner_type IN ('Consultant');


-- --------------------------------------------------
-- Handling NULL values
-- --------------------------------------------------

SELECT
    first_name,
    last_name
FROM d_partners
WHERE auth_expense_amt IS NULL;