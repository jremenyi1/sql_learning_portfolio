# SQL Basics — Notes

![SQL](https://img.shields.io/badge/SQL-Basics-blue)
![Oracle APEX](https://img.shields.io/badge/Oracle-APEX-red)
![Status](https://img.shields.io/badge/Status-Completed-brightgreen)
![Level](https://img.shields.io/badge/SCQF-Level%207-lightgrey)

These notes summarise my understanding of SQL fundamentals from Week 2, with a focus on how SQL is used in practice and why it is preferred over spreadsheets for many types of data work.

---

## SQL vs Excel — When to Use Each

Excel is useful for small datasets, quick checks, and one-off analysis. It is flexible and easy to use, which makes it ideal for personal tracking, budgeting, or early exploration of data.

However, Excel starts to struggle when:

- datasets become large
- multiple people edit the same file
- formulas break or results change unexpectedly
- version control becomes difficult

SQL databases are designed to handle these situations more reliably. Data is stored in a structured way, rules can be enforced, and many users can work with the same data at the same time. Queries can be reused and produce consistent results.

For this reason, SQL is widely used in professional environments, even though Excel is still valuable for ad-hoc tasks.

---

## Why Databases Matter

Databases provide:

- structure and consistency
- improved data integrity through constraints
- better performance for large datasets
- controlled and secure access
- reliable reporting and automation

SQL allows data to be queried, filtered, and transformed efficiently. Tasks that would be slow, manual, or error-prone in Excel can often be handled quickly and repeatably using SQL.

---

## Data Quality and Cleaning

Clean data is essential before loading it into a database.

This includes:

- removing duplicate records
- handling missing or invalid values
- standardising formats such as dates, currencies, and text

If data is not cleaned, SQL queries can return misleading or incorrect results. For small datasets, data cleaning can be done in Excel. For larger datasets, tools such as Python (for example, using pandas) are more appropriate.

Good data quality reduces errors and makes analysis more reliable.

---

## Real-World Impact of Poor Data Handling

Poor data management has caused serious real-world problems, including:

- lost COVID-19 test results due to spreadsheet limitations
- financial reporting errors caused by broken formulas
- inventory and operational failures driven by uncoordinated spreadsheets

These examples highlight why databases are critical when data becomes large, shared, or high-risk.