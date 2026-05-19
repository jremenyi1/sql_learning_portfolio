# SQL Functions and Operators — Notes

![SQL](https://img.shields.io/badge/SQL-Functions-blue)
![Oracle APEX](https://img.shields.io/badge/Oracle-APEX-red)
![Status](https://img.shields.io/badge/Status-Completed-brightgreen)
![Level](https://img.shields.io/badge/SCQF-Level%207-lightgrey)

These notes summarise my understanding of SQL functions and operators from
Week 4, with a focus on writing clearer queries and producing well-structured
outputs directly from SQL.

---

## Why SQL Functions Matter

Raw data is rarely in the exact format needed for analysis or reporting.
SQL functions allow data to be cleaned, transformed, and formatted as part of
the query itself.

Using functions helps to:

- reduce manual data cleaning
- make query results easier to read
- ensure consistent calculations
- keep logic in one place

---

## Logical Operators Revisited

Logical operators are often used together with functions and expressions.

The main operators are:

- `AND` — all conditions must be true
- `OR` — at least one condition must be true
- `NOT` — excludes matching values

When combined with calculations or string functions, careful use of brackets
becomes even more important.

---

## Operator Precedence and Expressions

SQL evaluates operators in a fixed order, not left to right.

For logical operators, the order is:

- `NOT`
- `AND`
- `OR`

For expressions, calculations are evaluated before filtering and sorting.

Using brackets makes both logical conditions and calculations easier to
understand and safer to modify later.

---

## String Functions

String functions are used to clean and standardise text data.

Common uses include:

- converting text to upper or lower case
- extracting part of a string
- removing extra spaces
- combining multiple text fields

These functions are especially useful when preparing report-friendly output.

---

## Numeric Functions and Calculations

Numeric functions allow values to be calculated and formatted inside queries.

They are commonly used for:

- rounding values
- applying percentage changes
- creating calculated totals

Combining numeric functions with arithmetic operators makes SQL a powerful tool
for basic analysis.