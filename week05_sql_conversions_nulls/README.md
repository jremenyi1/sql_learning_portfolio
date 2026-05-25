# Week 5 — SQL Conversion, NULL Handling, and Conditional Logic

This week focused on avoiding incorrect results caused by NULLs and implicit conversions.

The main goal was to stop relying on implicit behaviour and instead be explicit
about conversions, missing values, and conditional logic. Most queries will run
even when the data is messy — the challenge is making sure they return the
*right* result.

All examples were written and tested in Oracle APEX.

---

## What I Worked On

This week covered:

- converting data types using `TO_CHAR`, `TO_NUMBER`, and `TO_DATE`
- formatting dates and numbers for readable output
- handling missing values with `NVL`, `NVL2`, `COALESCE`, and `NULLIF`
- writing conditional logic with `CASE` and `DECODE`
- improving clarity through consistent formatting and aliases

A recurring lesson was that SQL often fails quietly. Queries may run without
errors while still producing misleading results if NULLs or conversions are
handled carelessly.

---

## Folder Contents

- `README.md`  
  Overview of the week’s focus.

- `conversion_and_nulls_notes.md`  
  Notes on conversion rules, NULL handling, and formatting.

- `conversion_and_null_functions_examples.sql`  
  Practical examples using conversion and NULL-related functions.

- `conditional_expressions_examples.sql`  
  Examples comparing `CASE` and `DECODE`.

- `submission_evidence.sql`  
  SQL queries submitted for the Week 5 assessment.

- `reflections.md`  
  A short reflection on what worked, what didn’t, and what to improve next.

---

## Notes

This week made it clear that correct SQL is not just about returning rows.
It is about making assumptions visible.

Using explicit conversions and handling NULLs deliberately made my queries
easier to read, easier to reason about, and much harder to misinterpret.