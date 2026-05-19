# Week 3 — SQL Conditions and Sorting

This week builds on basic filtering by focusing on query logic, result control,
and sorting. The main goal was to write queries that do exactly what I intend —
no more, no less.

All examples were written and tested in Oracle APEX.

---

## What I Worked On

This week covered:

- limiting result sets using `LIMIT`
- combining conditions with `AND`, `OR`, and `NOT`
- understanding logical operator precedence
- using brackets to make query logic explicit
- sorting results with `ORDER BY`, including multi-column sorting

A recurring theme was that syntactically correct SQL can still be logically
wrong if the conditions are not grouped carefully.

---

## Folder Contents

- `README.md`  
  Overview of the week’s focus.

- `limiting_and_logical_conditions.md`  
  Notes on limiting results and combining logical conditions.

- `logical_precedence_examples.sql`  
  Examples showing how `AND`, `OR`, and brackets change query results.

- `order_by_limit_sorting_examples.sql`  
  Sorting and limiting examples using `ORDER BY` and `LIMIT`.

- `submission_evidence.sql`  
  SQL queries submitted for the Week 3 assessment.

- `reflections.md`  
  A short reflection on lessons learned and areas to improve.

---

## Notes

This week highlighted how easy it is to get the *wrong* answer with SQL even
when the syntax is correct. Using brackets consistently made my queries easier
to read and much easier to reason about.