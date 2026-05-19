# SQL Basics — Notes

![SQL](https://img.shields.io/badge/SQL-Basics-blue)
![Oracle APEX](https://img.shields.io/badge/Oracle-APEX-red)
![Status](https://img.shields.io/badge/Status-Completed-brightgreen)
![Level](https://img.shields.io/badge/SCQF-Level%207-lightgrey)

These notes summarise my understanding of core SQL concepts from Week 2, with a focus on how SQL is used in practice and why it is preferred over spreadsheets for many types of data work.

---

## SQL vs Excel — When to Use Each

Excel is useful for small datasets, quick checks, and one-off analysis. It is flexible and easy to use, which makes it ideal for personal tracking, simple reporting, or early exploration of unfamiliar data.

Problems start to appear when:

- datasets grow beyond a manageable size  
- multiple people need to edit the same file  
- formulas become fragile or hard to trace  
- version control turns into guesswork 

SQL databases are designed for exactly these situations. Data is stored in a consistent structure, rules can be enforced at the database level, and many users can work with the same data without overwriting each other’s work. Queries can be saved, reused, and audited, producing the same results each time.

For this reason, SQL is standard in professional data environments, with Excel remaining useful for ad-hoc tasks rather than as a system of record.

---

## Why Databases Matter

Databases provide:

- structure and consistency
- improved data integrity through constraints
- better performance for large datasets
- controlled access and security
- reliable reporting and automation

SQL makes it possible to filter, combine, and transform data efficiently. Tasks that would be slow, manual, or error-prone in spreadsheets can often be handled cleanly and repeatably with well-written queries.

---

## Data Quality and Cleaning

Good analysis depends on clean data, regardless of the tool being used.

Typical cleaning steps include:

- removing duplicate records  
- handling missing or invalid values  
- standardising formats such as dates, currencies, and text  

If data quality issues are ignored, SQL queries can return results that look correct but are fundamentally misleading. For small datasets, basic cleaning can be done in Excel. For larger or more complex data, tools such as Python (for example, using pandas) are usually more appropriate.

Investing time in data quality upfront reduces downstream errors and makes results easier to trust.

---

## Real-World Consequences of Poor Data Handling

Poor data practices have caused serious real-world problems, including:

- lost COVID-19 test results due to spreadsheet limitations  
- financial reporting errors caused by broken or copied formulas  
- inventory and operational failures driven by disconnected, manually maintained files  

These cases highlight why databases become essential once data is large, shared, or high-risk. They also explain why SQL skills remain valuable across many roles, even outside traditional data teams.

