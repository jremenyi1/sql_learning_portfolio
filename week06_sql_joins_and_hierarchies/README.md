# Week 6 — SQL Joins and Hierarchical Queries

This week focused on how to combine data from multiple tables using SQL joins and 
how to represent hierarchical relationships using self-joins and hierarchical queries.

The main goal was to understand how different join types change the structure 
and completeness of query results, and how relational data can be used to 
build tree-like structures such as employee-manager relationships.

All examples were written and tested in Oracle APEX.

---

## What I Worked On

This week covered:

- `CROSS JOIN` and `NATURAL JOIN`
- `INNER JOIN` and `OUTER JOIN` (`LEFT`, `RIGHT`, `FULL`)
- `USING` vs `ON` clauses and when each one is appropriate
- `SELF JOIN` to model relationships within the same table (e.g. employees and managers)
- hierarchical queries using `START WITH`, `CONNECT BY PRIOR`, and `LEVEL`
- Oracle proprietary joins vs ANSI standard join syntax

A key learning point was that joins do not just combine tables — they control which rows are included, excluded, or duplicated in the final result set.

Another important insight was that hierarchical queries allow SQL to move beyond flat data and represent real-world structures like reporting lines and organisational charts.

---

## Folder Contents

- `README.md`
  Overview of the week’s focus and learning outcomes.

- `joins_and_hierarchies_notes.md`
  Detailed notes on join types, self joins, and hierarchical queries.

- `join_examples.sql`
  Practical examples of `CROSS`, `NATURAL`, `INNER`, and `OUTER` joins.

- `hierarchical_queries_examples.sql`
  Examples using `SELF JOIN` and `CONNECT BY` hierarchical queries.

- `submission_evidence.sql`
  SQL queries submitted for assessment tasks.

- `reflections.md`
  Weekly reflection on learning progress, challenges, and improvements.

- `week6_additional_examples.sql`
  Some more practical examples of SQL Joins & Hierarchies

---

## Notes

This week showed how important joins are in real database work.

The most important takeaway was that the same tables can produce completely different results depending on the join type used, especially when dealing with missing matches and NULL values.

Hierarchical queries also added a new way of thinking about data, where relationships are not just between two tables but can extend across multiple levels like a tree.