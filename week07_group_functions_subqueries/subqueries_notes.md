# Subqueries — Notes

These notes summarise my understanding of subqueries from Week 7, with a focus
on writing queries where one result depends on another and avoiding common
logic and null-handling issues.

---

## Why Subqueries Matter

Some questions cannot be answered by looking at a single table or a single
condition in isolation.

Subqueries allow one query to use the result of another, which is useful when:

- comparing rows to an overall value (such as an average)
- filtering based on grouped or calculated results
- checking whether related data exists
- expressing more complex business rules

Used well, subqueries make SQL more expressive. Used poorly, they can make
queries hard to understand and easy to get wrong.

---

## What Is a Subquery?

A subquery is a `SELECT` statement nested inside another query.

In most cases:

- the inner query runs first
- it returns a value or set of values
- the outer query uses that result for filtering or comparison

Subqueries are most commonly found in the `WHERE` clause, but can also appear in
other parts of a query.

---

## Single-Row Subqueries

Single-row subqueries return exactly one value.

They are typically used with comparison operators such as:

- `=`
- `>`
- `<`
- `>=`
- `<=`
- `<>`

Example:

```sql
SELECT last_name, salary
FROM employees
WHERE salary >
    (SELECT AVG(salary)
     FROM employees);
```

This query compares each employee’s salary to the overall average salary.

---

## Multiple-Row Subqueries

Multiple-row subqueries return more than one value.

They must be used with operators that can handle sets, such as:

- `IN`
- `ANY`
- `ALL`

Example:

```sql
SELECT last_name, salary
FROM employees
WHERE salary = ANY
    (SELECT MIN(salary)
     FROM employees
     GROUP BY department_id);
```

In this case, the subquery returns one value per department, and the outer query
compares each salary against that list.

---

## Correlated Subqueries

Correlated subqueries reference the outer query and run once for each row.

Because of this:

- they depend on values from the outer query
- they are more expensive to run
- the logic must be very clear

Example:

```sql
SELECT e.last_name, e.salary
FROM employees e
WHERE e.salary >
    (SELECT AVG(i.salary)
     FROM employees i
     WHERE i.department_id = e.department_id);
```

This compares each employee’s salary to the average salary within their own
department.

---

## EXISTS and NULL Pitfalls

`EXISTS` and `NOT EXISTS` check whether a subquery returns any rows.

They are often safer than `IN` or `NOT IN` when `NULL` values may be present.

Key points:

- `EXISTS` returns true if at least one row is found
- `NOT EXISTS` returns true if no rows are found
- `NOT IN` can behave unexpectedly if the subquery returns `NULL`

Being aware of how null values affect subqueries helps avoid silent logic
errors.

---

## Notes

Subqueries often make queries feel like they are answering two questions at
once. Keeping each step clear and readable makes the overall logic much
easier to understand and maintain.