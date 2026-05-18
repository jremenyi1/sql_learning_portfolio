# Week 03 Reflection – SQL Conditions and Sorting

## Overview

This week focused on improving the accuracy and clarity of SQL queries by limiting results, combining logical conditions correctly, and sorting outputs. I spent time understanding how SQL evaluates logic and why brackets are important when writing more complex `WHERE` clauses.

Working in Oracle APEX helped me see how small changes in logic can significantly change query results.

---

## What I Learned

### Limiting Results

I learned that using `LIMIT` is useful when exploring data or testing queries. It helps avoid large outputs and makes it easier to check whether a query behaves as expected.

---

### Logical Conditions and Precedence

I learned that SQL applies logical operators in a fixed order. `AND` is evaluated before `OR`, which can lead to unexpected results if brackets are not used.

Using brackets makes query logic clearer and helps ensure results match the intended business rule.

---

### Sorting Query Results

I learned how to use `ORDER BY` to control how results are displayed. Sorting data makes query outputs easier to read and interpret, especially when working with salaries or grouped data.

---

## Challenges This Week

The main challenge was understanding why some queries returned unexpected results even though the syntax was correct. This helped me realise that writing SQL is not only about syntax, but also about logic and evaluation order.

---

## 3 Things I Learned

1. `LIMIT` is useful for safe and manageable query testing.
2. Logical operator precedence can change query results.
3. Brackets improve both accuracy and readability.

---

## 2 Skills I Want to Improve

1. Writing more complex logical conditions with confidence.
2. Reading and reviewing query logic more carefully.

---

## 1 Action Plan

I will always use brackets when combining `AND` and `OR`, even if they are not strictly required. I will also practise reviewing queries slowly to check logic before running them.

---

## Final Note

This week helped me move beyond basic filtering and start thinking more carefully about query logic. It feels like an important step towards writing more reliable and professional SQL queries.