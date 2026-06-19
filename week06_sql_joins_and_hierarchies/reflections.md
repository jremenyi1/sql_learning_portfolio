# Week 06 Reflection — SQL Joins and Hierarchical Queries

This week focused on SQL joins and how relationships between tables are used to
produce meaningful results.

The main shift for me was realising that joins are not just about connecting
tables, but about controlling which data appears and which data disappears from
the result set.

Most of the work came down to understanding the role each table plays in a query,
rather than memorising join syntax.

---

## What I Learned

### Join Types

This week made the differences between join types much clearer.

- `INNER JOIN` only returns rows that exist in both tables.
- `LEFT OUTER JOIN` keeps all rows from the left table, even if no match exists.
- `RIGHT OUTER JOIN` does the same from the opposite direction.
- `FULL OUTER JOIN` keeps unmatched rows from both tables.
- `CROSS JOIN` creates all possible row combinations, which explains why result
  sets can become very large very quickly.
- `NATURAL JOIN` works automatically based on matching column names, but can be
  risky if the structure changes.

The key point is that the join type directly affects which records are visible in
the output.

---

### Self Joins

Self joins were the most confusing topic at first.

The important realisation was that the same table can represent two different
roles in a query. For example, one row represents an employee, while another row
from the same table represents their manager.

Using aliases allows SQL to treat the table as if it were two separate tables.
Once I understood this, self joins started to feel logical rather than strange.

---

### Hierarchical Queries

Hierarchical queries introduced a new way of thinking about data.

Using `START WITH`, `CONNECT BY PRIOR`, and `LEVEL` allows SQL to move through a
reporting structure automatically, instead of relying on multiple self joins.

This made it possible to display full organisational structures rather than just
direct employee–manager pairs.

---

## Challenges

The main challenge this week was reading complex queries without getting lost in
aliases and join conditions.

With self joins and hierarchical queries, it was easy to lose track of which role
each table instance was playing.

I had to slow down and read queries line by line, focusing on what each alias
represented instead of rushing to understand the full query at once.

---

## Key Points from This Week

- Joins control which data appears in the final result set
- A self join is the same table used in different roles
- `LEFT JOIN` prevents data from disappearing when relationships are missing
- Hierarchical queries represent tree structures, not flat data
- Understanding the logic matters more than memorising syntax

---

## What I’ll Focus on Next

I want to become more confident reading joins without hesitation.

I understand the concepts, but I still need practice recognising join patterns
quickly, especially in longer queries with multiple conditions.

Next week I plan to practise rewriting joins in my own words and sketching simple
diagrams to match the SQL logic before running queries.