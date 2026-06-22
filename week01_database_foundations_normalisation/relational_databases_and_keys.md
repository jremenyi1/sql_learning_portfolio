# Relational Databases and Key Concepts — Notes

These notes summarise my understanding of relational databases and why they are
used instead of flat-file designs.

---

## Flat-File Databases

A flat-file database stores all data in a single table.

While simple, this approach leads to:

- repeated data
- inconsistencies
- difficult updates and deletions

Example: storing book details, authors, and publishers in one table causes the
same information to be repeated multiple times.

---

## Relational Databases

A relational database stores data across multiple related tables.

Key characteristics:

- data is organised into tables (rows and columns)
- each table represents one entity or topic
- tables are linked using keys
- redundancy is reduced

Advantages include:

- improved data integrity
- consistency across tables
- better performance and scalability

---

## Key Terminology

- **Table**: basic data storage structure  
- **Row**: one record in a table  
- **Column**: an attribute describing the data  
- **Field**: a single value at the intersection of a row and column  
- **Primary Key**: uniquely identifies each row  
- **Foreign Key**: references a primary key in another table

---

## Rules for Relational Tables

- each table has a unique name
- each row is uniquely identifiable
- column values are atomic
- column order and row order do not matter