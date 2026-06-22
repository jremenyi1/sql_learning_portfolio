# Week 1 — Submission Evidence (Database Design and Normalisation)

## Assessment Submission

The formal submission for Week 1 was completed and submitted as a PDF:

- `**submission_week1_SQL.pdf**`  

This Markdown file documents the scope and structure of the submitted work and
explains how the design decisions align with relational database principles.
---

## Submission Overview

The Week 1 submission focuses on **planning and designing a relational database**
for a defined business scenario, including:

- identifying entities and attributes
- assigning primary and foreign keys
- defining relationships and cardinality
- applying normalisation up to Third Normal Form (3NF)

The scenario, schema design, and normalisation steps are all contained
in the submitted PDF.
---

## Database Scenario

**Scenario:**  

An online bookstore sells books to customers.

- Customers can place orders
- Each order may include multiple books
- The database must support customers, orders, books, and order line items

This scenario was used to drive all table definitions, relationships,
and normalisation decisions.

---

## Table Definitions and Primary Keys

The following tables were defined in the submission.

### Customers

- `customer_id` (Primary Key)
- `first_name`
- `last_name`
- `email_address`
- `address`
- `city`
- `zip_code`

### Books

- `book_id` (Primary Key)
- `title_book`
- `author`
- `date_publication`
- `price`
- `stock_quantity`

### Orders

- `order_id` (Primary Key)
- `order_date`
- `customer_id` (Foreign Key)

### Order_Items

- `order_item_id` (Primary Key)
- `order_id` (Foreign Key)
- `book_id` (Foreign Key)
- `quantity_book`
- `unit_price`

Each table was designed with a single, clearly defined primary key to support
relational integrity.
---

## Relationships and Cardinality

The following relationships and cardinalities were defined in the submission:

- **Customers → Orders**  
  One customer can place many orders  
  *(One-to-many)*

- **Orders → Order_Items**  
  One order can contain many order items  
  *(One-to-many)*

- **Orders ↔ Books**  
  An order can contain many books, and a book can appear in many orders  
  *(Many-to-many, resolved via Order_Items)*

- **Books → Order_Items**  
  One book can appear in many order items  
  *(One-to-many)*

The `Order_Items` table acts as a junction table to resolve the many-to-many
relationship between orders and books.
---

## Normalisation

The database design was normalised step by step to ensure data integrity and
avoid redundancy.

### First Normal Form (1NF)

- Each table has a primary key
- Each field contains a single, atomic value
- No repeating groups or lists

**Example:**  

Books within an order are stored as separate rows in the `Order_Items` table
rather than as a list in the `Orders` table.
---

### Second Normal Form (2NF)

- All non-key attributes depend on the full primary key

**Examples:**

- Customer details are stored only in the `Customers` table
- Book details are stored only in the `Books` table

This avoids partial dependency and duplication across tables.
---

### Third Normal Form (3NF)

- No non-key attribute depends on another non-key attribute

**Examples:**

- Customer email depends only on `customer_id`
- Book price depends only on `book_id`

This ensures that each fact is stored in exactly one place.
---

## Conceptual Design

The final design includes:

- clearly defined primary keys
- foreign keys linking related tables
- one-to-many and many-to-many relationships
- a structure consistent with Third Normal Form

A conceptual diagram with keys and cardinality is included in the submitted PDF.
---

## Notes

This submission focuses on **design clarity and correctness** rather than
implementation or SQL querying.

The goal of Week 1 was to build a solid foundation for later weeks involving data
manipulation and querying, ensuring that future SQL operations are supported by a
well-structured relational schema.
