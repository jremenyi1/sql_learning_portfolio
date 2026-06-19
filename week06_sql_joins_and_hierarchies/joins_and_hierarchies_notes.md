# Joins and Hierarchical Queries — Notes

![Input](https://img.shields.io/badge/Input-SQL%20Joins-blue)
![Output](https://img.shields.io/badge/Output-Hierarchical%20Queries-green)
![Status](https://img.shields.io/badge/Status-Completed-brightgreen)
![Level](https://img.shields.io/badge/SCQF-Level%207-lightgrey)

These notes cover SQL join types and hierarchical queries from Week 6.

The focus is on understanding how relational tables are combined and how hierarchical structures can be represented in SQL.

All examples were written and tested in Oracle APEX.

---

## Why Joins Matter

- Relational databases store data across multiple tables.
- Joins allow this data to be combined into meaningful results.
- Without joins, data stays fragmented and is harder to analyse.

A key idea is that joins don’t just combine data — they define what data is included or excluded in the final result.

---

## CROSS JOIN

A `CROSS JOIN` returns all possible combinations of rows between two tables (Cartesian product).

```sql
SELECT e.last_name, d.department_name
FROM employees e
CROSS JOIN departments d;
```

- This can produce very large result sets, so it should be used carefully.
- It is mainly used for testing, simulations, or generating combinations.

---

## NATURAL JOIN

A `NATURAL JOIN` automatically joins tables based on columns with the same name.

```sql
SELECT *
FROM employees
NATURAL JOIN departments;
```

**Key issue:**

- The join condition is implicit
- Column matching is automatic
- Schema changes can break results without warning

Because of this, `NATURAL JOIN` is rarely used in production systems.

---

## INNER JOIN

`INNER JOIN` returns only rows where there is a match in both tables.

```sql
SELECT e.last_name, d.department_name
FROM employees e
INNER JOIN departments d
ON e.department_id = d.department_id;
```

- This is the most commonly used join type in real-world SQL.
- It is reliable, explicit, and easy to read.

---

## OUTER JOINS

Outer joins return matching rows plus unmatched rows depending on direction.

`LEFT JOIN`

```sql
SELECT e.last_name, d.department_name
FROM employees e
LEFT JOIN departments d
ON e.department_id = d.department_id;
```

`RIGHT JOIN`

```sql
SELECT e.last_name, d.department_name
FROM employees e
RIGHT JOIN departments d
ON e.department_id = d.department_id;
```

`FULL OUTER JOIN`

```sql
SELECT e.last_name, d.department_name
FROM employees e
FULL OUTER JOIN departments d
ON e.department_id = d.department_id;
```

---

## SELF JOIN

A self join is when a table is joined to itself.

- This is useful for hierarchical relationships like employees and managers.

```sql
SELECT e.last_name AS employee,
       m.last_name AS manager
FROM employees e
LEFT JOIN employees m
ON e.manager_id = m.employee_id;
```

This helps represent reporting structures inside a single table.

---

## HIERARCHICAL QUERIES

Oracle supports hierarchical queries using `CONNECT BY`.

```sql
SELECT last_name, level
FROM employees
START WITH last_name = 'King'
CONNECT BY PRIOR employee_id = manager_id;
```

**Key concepts:**

- `START WITH` defines the root of the hierarchy
- `CONNECT BY PRIOR` defines the relationship between rows
- `LEVEL` shows depth in the hierarchy

This allows SQL to “walk” a tree structure inside relational data.

---

## ORACLE vs ANSI JOINS

Oracle previously used proprietary `(+)` syntax for outer joins:

```sql
WHERE e.department_id = d.department_id(+)
```

Modern SQL uses ANSI join syntax:

```sql
LEFT JOIN departments d
ON e.department_id = d.department_id
```

**Why ANSI is preferred:**

- clearer and easier to read
- works across different database systems
- easier to maintain in complex queries
- supports full outer joins properly

---

## Key Takeaways

- `INNER JOIN` is the most commonly used join
- `OUTER JOINS` handle missing relationships
- `CROSS JOIN` can explode result size if not controlled
- `NATURAL JOIN` is risky due to implicit matching
- `SELF JOIN` is useful for hierarchy structures
- `CONNECT BY` allows tree-style traversal in Oracle SQL

The main learning point is that joins control the shape of your data, not just how tables are connected.