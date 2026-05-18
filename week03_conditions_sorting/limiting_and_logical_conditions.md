# Limiting and Logical Conditions — Notes

![SQL](https://img.shields.io/badge/SQL-Conditions-blue)
![Oracle APEX](https://img.shields.io/badge/Oracle-APEX-red)
![Status](https://img.shields.io/badge/Status-Completed-brightgreen)
![Level](https://img.shields.io/badge/SCQF-Level%207-lightgrey)

These notes summarise my understanding of **limiting results and logical conditions in SQL** from Week 3, with a focus on writing clearer and more accurate `SELECT` queries.

---

## Why Limiting Results Matters

Database tables can contain large numbers of rows. Returning all rows is often unnecessary and can make results difficult to read or interpret.

Limiting results is useful when:

- exploring a new table
- checking that a query works as expected
- avoiding very large outputs
- testing queries safely during learning

SQL provides the `LIMIT` keyword to control how many rows are returned.

---

## Using LIMIT

`LIMIT` restricts the number of rows returned by a query.

Example:

`SELECT *`
`FROM f_staffs`
`LIMIT 10;`

This query returns only the first 10 rows from the table. Without sorting, the rows returned are not guaranteed to be in a specific order.

For this reason, `LIMIT` is often used together with `ORDER BY`.


## Combining Conditions with Logical Operators

Most real-world queries need more than one condition. SQL allows conditions to be combined using logical operators in the WHERE clause.

The main logical operators are:
- `AND` — all conditions must be true
- `OR` — at least one condition must be true
- `NOT` — excludes matching values

Using these operators allows queries to better reflect real business rules.


## Logical Precedence in SQL

SQL does not evaluate conditions from left to right. Instead, it follows a fixed order:

- `NOT`
- `AND`
- `OR`

This means that queries mixing `AND` and `OR` can return unexpected results if brackets are not used.


## Why Brackets Are Important

Brackets make the intended logic of a query explicit and easier to understand.

Example:

`SELECT *`
`FROM f_staffs`
`WHERE (department = 'Sales' OR department = 'Marketing')`
`AND salary > 10;`

### Using brackets:

- improves readability
- reduces logic errors
- makes queries easier to review and maintain

As queries become more complex, brackets become essential rather than optional.