# Table Creation and Constraints — Notes

These notes summarise my understanding of table creation, constraints,
and basic schema design from Week 8, with a focus on clarity, correctness,
and long-term usability.

---

## Why Table Design Matters

Once a table is created, changing it later can be risky or disruptive.

A well-designed table:

- prevents invalid data from being inserted
- makes queries simpler and more reliable
- reflects real-world rules clearly
- reduces the need for defensive query logic later

This week showed that **good SQL starts before the first `SELECT` statement**.

---

## Creating Tables with CREATE TABLE

Tables are created using `CREATE TABLE`, where each column is defined with:

- a name
- a data type
- optional constraints

Example ideas covered this week:

- using `NUMBER` with appropriate precision for salaries and IDs
- using `VARCHAR2` for names and emails
- using `DATE` for admission and hire dates

Choosing the correct data type early helps avoid confusion and unnecessary conversions later.

---

## Using Constraints to Protect Data

Constraints enforce rules at the database level rather than relying on users or applications.

The main constraints used this week were:

- `NOT NULL` — ensures required fields are always filled
- `PRIMARY KEY` — uniquely identifies each row
- `UNIQUE` — prevents duplicate values
- `CHECK` — enforces simple business rules (e.g. salary > 0)
- `FOREIGN KEY` — maintains relationships between tables (conceptual focus)

Naming constraints explicitly made error messages clearer and tables easier to manage.

---

## Modifying Tables with ALTER TABLE

Real systems evolve, so tables often need to change.

Using `ALTER TABLE`, I practised:

- adding new columns
- adding constraints after table creation
- changing default values
- refining table structure as requirements changed

This reinforced the idea that **schema changes should be deliberate and well understood**,
especially once data exists.

---

## Managing Tables Safely

Several table-level commands were compared:

- `DELETE` — removes rows, can be rolled back
- `TRUNCATE` — removes all rows quickly, cannot be rolled back
- `DROP TABLE` — removes the table entirely

Understanding these differences is important to avoid irreversible mistakes.