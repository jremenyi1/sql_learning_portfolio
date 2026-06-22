# Week 01 Reflection — Database Foundations and Normalisation

This week focused less on writing SQL and more on understanding how databases
*should* be designed before queries are written.

---

## What I Learned

### Relational Database Design

I learned why relational databases are preferred over flat files, particularly
for maintaining consistency and avoiding duplicated data.

### Normalisation

Normalisation clarified how poor structure leads to update, insert, and delete
anomalies. Seeing the step-by-step progression from 1NF to 3NF made the logic
behind table splitting much clearer.

### Business Rules

Understanding business rules helped connect technical design decisions to
real-world requirements.

---

## Challenges

The most challenging part was identifying partial and transitive dependencies.
These are not always obvious at first glance and require slowing down and
analysing dependencies carefully.

---

## Key Takeaways

- database design underpins reliable SQL
- normalisation reduces both redundancy and confusion
- good structure makes later querying easier and safer

---

## What I’ll Focus on Next

I want to move from designing databases to actively querying them, using SQL to
explore and validate well-structured data.