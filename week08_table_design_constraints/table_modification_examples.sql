/*
File: table_modification_examples.sql
Purpose: Practice examples demonstrating table modification
         using ALTER TABLE and constraint management.
Week: 8
*/

------------------------------------------------------------
-- Add new columns to an existing table
-- Used to evolve a table as requirements change
------------------------------------------------------------

ALTER TABLE employees
ADD (
    email VARCHAR2(100)
        CONSTRAINT employees_email_nn NOT NULL,

    phone_number VARCHAR2(20),

    hire_date DATE
        CONSTRAINT employees_hdate_nn NOT NULL,

    bonus NUMBER(8,2)
);


------------------------------------------------------------
-- Modify an existing column default value
-- Useful when business rules change over time
------------------------------------------------------------

ALTER TABLE department_salaries
MODIFY salary NUMBER(10,2) DEFAULT 1000;


------------------------------------------------------------
-- Add a CHECK constraint
-- Enforces business rules at the database level
------------------------------------------------------------

ALTER TABLE department_salaries
ADD CONSTRAINT chk_salary_positive
CHECK (salary > 0);


------------------------------------------------------------
-- Add a PRIMARY KEY to an existing table
-- Ensures each row can be uniquely identified
------------------------------------------------------------

ALTER TABLE department_salaries
ADD employee_id NUMBER(8)
    CONSTRAINT employee_pk PRIMARY KEY;


------------------------------------------------------------
-- Verify table structure after modifications
-- Confirms columns and constraints were applied correctly
------------------------------------------------------------

DESCRIBE employees;

DESCRIBE department_salaries;


------------------------------------------------------------
-- Example: dropping a column
-- This operation is irreversible
------------------------------------------------------------

ALTER TABLE employees
DROP COLUMN phone_number;


------------------------------------------------------------
-- Example: marking a column as UNUSED
-- Safer option for large tables before permanent removal
------------------------------------------------------------

ALTER TABLE employees
SET UNUSED (bonus);


------------------------------------------------------------
-- Notes:
-- ALTER TABLE allows controlled schema evolution.
-- Constraints help prevent invalid data at source.
-- DESCRIBE is essential after structural changes.
-- Care is required because many DDL operations
-- cannot be rolled back.
------------------------------------------------------------