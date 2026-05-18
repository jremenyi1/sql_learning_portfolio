/*
============================================================
Week 3 - Submission Evidence (SQL Practice Tasks)
============================================================

This file contains all SQL queries submitted for Week 3.
Each submission is clearly labelled and commented.

Focus areas:
- arithmetic expressions
- logical conditions
- date filtering
- sorting using ORDER BY
============================================================
*/

------------------------------------------------------------
-- SUBMISSION 1: Event Financial Report
--
-- Objective:
-- Generate an event financial report showing:
-- - original event cost
-- - final total cost after adding £300
-- - applying 12% tax
--
-- Conditions:
-- - only events costing more than 1500
-- - only events after 01-JAN-2026
-- - results sorted by final total cost (highest first)
------------------------------------------------------------

SELECT
    name,
    cost AS "Original Cost",
    (cost + 300) * 1.12 AS "Final Total Cost"
FROM d_events
WHERE cost > 1500
  AND event_date > TO_DATE('01-JAN-2026', 'DD-MON-YYYY')
ORDER BY "Final Total Cost" DESC;

-- Note:
-- No records matched the date condition (> 01-JAN-2026),
-- so no CSV output was generated for this query.


------------------------------------------------------------
-- SUBMISSION 2: Partner Financial Performance Report
--
-- Objective:
-- Calculate a revised authorised expense amount by:
-- - applying a 7% increase
-- - adding a fixed £400 bonus
--
-- Conditions:
-- - authorised expense must not be NULL
-- - authorised expense must be greater than 1000
-- - results sorted by revised total (highest first)
------------------------------------------------------------

SELECT
    first_name,
    last_name,
    auth_expense_amt AS "Original Total",
    (auth_expense_amt * 1.07) + 400 AS "Revised Total"
FROM d_partners
WHERE auth_expense_amt IS NOT NULL
  AND auth_expense_amt > 1000
ORDER BY "Revised Total" DESC;

-- Note:
-- One record met the criteria and was included
-- in the exported CSV output.


------------------------------------------------------------
-- SUBMISSION 3: CD Inventory and Production Report
--
-- Objective:
-- Display CDs where:
-- - the title begins with the letter 'A'
--   OR
-- - the producer is 'Sony Music'
--
-- Sorting:
-- - producer in ascending order
-- - year in descending order
------------------------------------------------------------

SELECT
    cd_number,
    title,
    producer,
    year
FROM d_cds
WHERE title LIKE 'A%'
   OR producer = 'Sony Music'
ORDER BY producer ASC,
         year DESC;

-- Note:
-- No records matched the filter conditions
-- in this dataset.