# Week 7 — Group Functions and Subqueries

This week focused on summarising data and writing queries that depend on the
results of other queries. The main goal was to combine aggregate functions and
subqueries to answer questions that cannot be solved with simple filtering
alone.

All examples were written and tested in Oracle APEX.

---

## What I Worked On

This week covered:

- using aggregate functions such as `COUNT`, `SUM`, `AVG`, `MIN`, and `MAX`
- understanding how `DISTINCT` and `NVL` affect aggregated results
- grouping rows with `GROUP BY`
- filtering grouped results using `HAVING`
- writing single-row and multiple-row subqueries
- understanding correlated subqueries and when they are necessary
- using subquery operators such as `IN`, `ANY`, `ALL`, `EXISTS`, and `NOT EXISTS`

A recurring theme was that while subqueries are powerful, they can easily
introduce logical errors if null values and query intent are not handled
carefully.

---

## Folder Contents

- `README.md`
  Overview of the week’s focus.

- `group_functions_notes.md`
  Notes on aggregate functions, grouping, and null handling.

- `subqueries_notes.md`
  Notes on single-row, multiple-row, and correlated subqueries.

- `group_functions_examples.sql`
  Practice queries using aggregate functions.

- `subqueries_examples.sql`
  Practice queries demonstrating different types of subqueries.

- `submission_evidence.sql`
  SQL queries submitted for the Week 7 assessment.

- `reflections.md`
  A short reflection on lessons learned and areas to improve.

---

## Notes

This week reinforced that many SQL queries answer *two steps at once*:
first calculating a value, then using that value to filter or compare results.
Being explicit about intent made the queries easier to read and reason about.