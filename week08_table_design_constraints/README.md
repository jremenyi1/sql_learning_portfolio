# Week 8 — Creating and Modifying Tables, Constraints, and Aggregate Queries

This week shifted focus from querying existing data to **designing the tables**
**themselves**. Instead of just asking questions of data, I worked on defining
how data should be stored, protected, structured and analysed from the start.

The main goal was to understand how **good table design and constraints**
**lead to more reliable queries later on**.

All examples were written and tested in Oracle APEX.

---

## What I Worked On

This week covered:

- creating tables using `CREATE TABLE`
- choosing appropriate data types (`NUMBER`, `VARCHAR2`, `DATE`)
- applying constraints to protect data integrity
- modifying existing tables using `ALTER TABLE`
- understanding the difference between `DELETE`, `TRUNCATE`, and `DROP`
- using aggregate functions (`AVG`, `MIN`, `MAX`)
- writing subqueries and correlated subqueries
- validating query results with test data

A recurring theme was that **SQL design decisions made early have long-term**
**effects** on correctness, maintainability, and confidence in query results.

---

## Key Idea

SQL is not just about writing queries that run.  
It is about designing structures that prevent mistakes before they happen.

Constraints act as guardrails, and aggregate queries only make sense when the
underlying data is well designed.

---

## Folder Contents

- `README.md`
  
  Overview of the week’s focus.

- `table_design_creation_and_constraints.md`
  
  Notes on creating tables, choosing data types, and applying constraints.

- `table_design_creation_and_constraints_examples.sql`
  
  Examples of table creation and constraints.

- `table_modification_examples.sql`
  
  Examples of table modifications.

- `real_world_examples.sql`
  
  Examples of real world.

- `aggregate_query_subquery_examples.sql`
  
  Practice queries using `AVG`, `MIN`, `MAX`, `GROUP BY`, and subqueries.

- `submission_evidence.sql`
  
  SQL scripts submitted for the Week 8 assessment.

- `reflections.md`
  
  Weekly reflection on learning, challenges, and next steps.

---

## Notes

This week made it clear that **SQL is not just about writing queries that run**,
but about designing structures that prevent mistakes before they happen.
Constraints act like guardrails, and aggregate queries only make sense when
the underlying data is well designed.