# Normalisation — Worked Examples

These examples demonstrate how tables are brought into First, Second, and Third
Normal Form using Week 1 practice exercises.

---

## First Normal Form (1NF)

A table is in 1NF when:

- each field contains a single value
- there are no repeating groups

### Original (not 1NF)

| Item ID | Color        | Unit Price |
|--------|--------------|------------|
| IT001  | Red, Blue    | $16.56     |

### Normalised (1NF)

| Item ID | Color | Unit Price |
|--------|-------|------------|
| IT001  | Red   | $16.56     |
| IT001  | Blue  | $16.56     |

---

## Second Normal Form (2NF)

A table is in 2NF when:

- it is already in 1NF
- all non-key attributes depend on the *entire* primary key

### Issue

Location depends only on `Store ID`, not on the full composite key.

### Solution

Split into:

**SUPPLIER_STORE_DETAILS**  
(Supplier ID, Store ID)

**STORE_LOCATION**  
(Store ID, Location)

---

## Third Normal Form (3NF)

A table is in 3NF when:

- it is in 2NF
- no non-key attribute depends on another non-key attribute

### Issue

Category Description depends on Category ID, not directly on Book ID.

### Solution

Split into:

**BOOK_PRICE_DETAILS**  
(Book ID, Category ID, Price)

**CATEGORY_DETAILS**  
(Category ID, Category Description)