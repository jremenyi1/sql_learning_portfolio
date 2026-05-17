# Week 02 Reflection – SQL and Data

## Overview

This week focused on the basics of SQL, especially how to retrieve and manipulate data using SELECT statements, arithmetic operations, and the WHERE clause. I also spent time understanding when SQL is more suitable than Excel and how data quality affects query accuracy.

Working in Oracle APEX helped me practise writing real queries and see how small syntax changes can completely change results.

---

## What I Learned

### SQL vs Excel

I learned that SQL is much more reliable than Excel when working with large or shared datasets. Excel is useful for quick analysis, small datasets, and simple calculations, but it becomes unstable when data grows or when multiple people work on the same file.

SQL databases solve these issues by storing data in a structured way. They allow multiple users to access the same data safely, and queries always return consistent results.

---

### Arithmetic and Operator Precedence

I learned that the order of operations in SQL matters a lot. Using brackets correctly ensures calculations are performed in the right sequence.

For example:
- Adding a bonus before applying tax gives a different result than applying tax first
- Multiplying before adding a fixed value changes the final output

This made it clear that SQL is not just about writing queries, but also about understanding logic and calculation order.

---

### Filtering Data with WHERE

I learned how to filter data using different conditions:

- `LIKE` for pattern matching
- `=` and `<` for comparisons
- `BETWEEN` for ranges
- `IN` for specific sets of values
- `IS NULL` for missing data

This helped me understand how SQL allows precise control over what data is returned.

---

### Data Quality Matters

I also learned that poor data quality can completely break SQL results. Missing values, duplicates, or inconsistent formats can lead to incorrect outputs.

Cleaning data before inserting it into a database is essential. This can be done in Excel for small datasets or using Python (pandas) for larger datasets.

---

## Challenges This Week

I had some difficulties accessing Oracle APEX at the beginning, which slowed down my progress. I could not see the required tables initially, and this made it difficult to start the tasks.

Once the access issue was resolved, I was able to complete all SQL exercises. This helped me understand that technical setup issues are part of working with real systems.

---

## 3 Things I Learned

1. SQL is more reliable than Excel for structured and shared data.
2. Brackets and operator precedence change query results significantly.
3. Clean data is essential for accurate SQL outputs.

---

## 2 Skills I Want to Improve

1. Writing more complex queries combining multiple conditions and operations.
2. Organising and exporting SQL work more efficiently from Oracle APEX.

---

## 1 Action Plan

I will practise SQL regularly in Oracle APEX using the workbook exercises. I will also review any mistakes carefully to understand why queries fail or produce unexpected results.

My goal is to become more confident in combining SELECT, WHERE, and arithmetic operations without needing to check syntax every time.

---

## Final Note

This week helped me build a stronger foundation in SQL logic and data handling. I still see it as early-stage learning, but I can already see how these skills apply to real-world data analysis and reporting.