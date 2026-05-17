/*
File: where_clause_examples.sql
Purpose: Demonstrate correct use of the WHERE clause for filtering data.

Focus:
- text filtering
- numeric comparisons
- range checks
- list-based filtering
- handling NULL values
*/

------------------------------------------------------------
-- Task 1: Basic text filtering using LIKE
-- Business rule:
-- Return clients whose last name starts with the letter 'S'.
------------------------------------------------------------

SELECT
    first_name,
    last_name
FROM d_clients
WHERE last_name LIKE 'S%';


------------------------------------------------------------
-- Task 2: Numeric comparison
-- Business rule:
-- Identify events with a cost below 1000.
------------------------------------------------------------

SELECT
    id
FROM d_events
WHERE cost < 1000;


------------------------------------------------------------
-- Task 3: Range filtering using BETWEEN
-- Business rule:
-- Return events with costs between 500 and 2000 (inclusive).
------------------------------------------------------------

SELECT
    id
FROM d_events
WHERE cost BETWEEN 500 AND 2000;


------------------------------------------------------------
-- Task 4: Filtering using IN
-- Business rule:
-- Return partners who are consultants.
------------------------------------------------------------

SELECT
    first_name,
    last_name
FROM d_partners
WHERE partner_type IN ('Consultant');


------------------------------------------------------------
-- Task 5: Handling NULL values
-- Business rule:
-- Identify partners with no authorised expense amount recorded.
------------------------------------------------------------

SELECT
    first_name,
    last_name
FROM d_partners
WHERE auth_expense_amt IS NULL;