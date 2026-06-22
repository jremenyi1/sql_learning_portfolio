# Business Rules and Unique Identifiers — Notes

This file summarises how business rules and unique identifiers guide database
design.

---

## Business Rules

Business rules describe how data must behave.

Examples identified:

- a customer can place zero, one, or many orders
- an order must belong to exactly one customer
- a payment must be linked to one order
- an order must reference valid products

### Types of Business Rules

- **Structural**: define data structure  
- **Procedural**: define process behaviour  
- **Programmatic**: enforce rules through code

---

## Unique Identifiers (UIDs)

A unique identifier allows one record to be selected unambiguously.

Examples:

- `student_id` for STUDENT
- `song_id` for SONG
- composite key (`title`, `date_released`) for MOVIE
- artificial IDs used where natural keys are unstable

UIDs become **primary keys** in relational tables and are essential for defining
relationships.