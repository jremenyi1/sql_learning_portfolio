# Group Functions — Notes

![SQL](https://img.shields.io/badge/SQL-Conditions-blue)
![Oracle APEX](https://img.shields.io/badge/Oracle-APEX-red)
![Status](https://img.shields.io/badge/Status-Completed-brightgreen)
![Level](https://img.shields.io/badge/SCQF-Level%207-lightgrey)

These notes summarise my understanding of SQL group functions from Week 7,
with a focus on summarising data clearly and avoiding common mistakes with
null values and grouping.

---

## Why Group Functions Matter

Database tables often contain detailed, row-level data. On its own, this level
of detail is not always useful.

Group functions allow many rows to be reduced into meaningful summaries, which
is essential for reporting, analysis, and comparison.

Group functions are useful when:

- counting records
- calculating totals or averages
- finding minimum or maximum values
- comparing results across departments or categories

Without group functions, many real-world questions cannot be answered in SQL.

---

## Common Group Functions

SQL provides several built-in group (aggregate) functions:

- `COUNT` — counts rows or non-null values
- `SUM` — adds numeric values
- `AVG` — calculates the average
- `MIN` — finds the smallest value
- `MAX` — finds the largest value

A group function used without a `GROUP BY` clause always returns a single row
summarising the entire table.

---

## COUNT, DISTINCT, and NULL Values

`COUNT` behaves differently depending on how it is used:

- `COUNT(*)` counts all rows in the table
- `COUNT(column)` ignores rows where the column is `NULL`
- `DISTINCT` removes duplicate values before aggregation

Example:

```sql
SELECT COUNT(DISTINCT job_id)
FROM employees;
```

This query counts the **number of unique job** roles rather than the total number
of employees.

Understanding how `NULL` values are handled is essential for interpreting
aggregate results correctly.

---

## Using NVL with Group Functions

`NVL` replaces `NULL` values with a specified default. When used with group
functions, this can change the meaning of the result.

Example:

```sql
SELECT AVG(NVL(commission_pct, 0))
FROM employees;
```

In this case, employees without a commission are treated as having a value of
zero, which affects the calculated average.

Using `NVL` can be helpful, but it should always reflect the real-world meaning
of the data.

---

## GROUP BY and HAVING

`GROUP BY` defines how rows are grouped before aggregation.

`HAVING` is used to filter groups **after group functions** have been applied.

Example:

```sql
SELECT department_id, AVG(salary)
FROM employees
GROUP BY department_id
HAVING AVG(salary) > 5000;
```

This query filters entire groups based on their average salary, not individual
rows.

---

## Notes

- Group functions often change how a query needs to be written and interpreted.
- Being clear about what is being grouped, what is being calculated, and when
filters are applied makes results easier to understand and trust.