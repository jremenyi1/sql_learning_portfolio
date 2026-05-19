/*
============================================================
Week 3 — Submission Evidence (SQL Practice Tasks)
============================================================

Purpose:
This file contains SQL queries submitted for assessment
during Week 3 of my SQL learning programme.

Each section documents a single task, including the
objective and the business logic applied. The emphasis
is on correctness, clarity, and traceability rather than
performance optimisation.

Environment:
- SQL dialect: Oracle SQL (Oracle APEX)
============================================================
*/

-- --------------------------------------------------
-- TASK 1: Event financial report
--
-- Objective:
-- Generate an event financial report showing:
-- - original event cost
-- - final total cost after adding £300
-- - applying 12% tax
--
-- Business rules:
-- - Include only events with cost > 1500
-- - Include only events after 01-JAN-2026
-- - Sort results by final total cost (descending)
--
-- Notes:
-- No records matched the date condition in this dataset
-- --------------------------------------------------

SELECT
    name,
    cost AS "Original Cost",
    (cost + 300) * 1.12 AS "Final Total Cost"
FROM d_events
WHERE cost > 1500
  AND event_date > TO_DATE('01-JAN-2026', 'DD-MON-YYYY')
ORDER BY "Final Total Cost" DESC;


-- --------------------------------------------------
-- TASK 2: Partner financial performance report
--
-- Objective:
-- Calculate revised authorised expense amounts
--
-- Business rules:
-- - Apply a 7% increase
-- - Add a fixed bonus of 400
-- - Exclude NULL authorised expenses
-- - Include only values greater than 1000
-- - Sort results by revised total (descending)
--
-- Notes:
-- One record met the criteria and was included
-- --------------------------------------------------

SELECT
    first_name,
    last_name,
    auth_expense_amt AS "Original Total",
    (auth_expense_amt * 1.07) + 400 AS "Revised Total"
FROM d_partners
WHERE auth_expense_amt IS NOT NULL
  AND auth_expense_amt > 1000
ORDER BY "Revised Total" DESC;


-- --------------------------------------------------
-- TASK 3: CD inventory and production report
--
-- Objective:
-- Return selected CDs based on title or producer rules
--
-- Business rules:
-- - Include CDs where title starts with 'A'
-- - OR producer is 'Sony Music'
-- - Sort by producer (ascending)
-- - Then sort by year (descending)
--
-- Notes:
-- No records matched the filter conditions in this dataset
-- --------------------------------------------------

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