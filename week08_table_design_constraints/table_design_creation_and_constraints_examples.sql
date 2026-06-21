/*
File: table_design_creation_and_constraints_examples.sql
Purpose: Practice examples demonstrating table creation
         and the use of constraints to enforce data integrity.
Week: 8
*/

------------------------------------------------------------
-- CREATING A TABLE WITH CONSTRAINTS 
-- Ensures data integrity from the start
-- - PRIMARY KEY constraint
-- - Uniquely identifies each row in a table
-- - NOT NULL constraints
-- - Ensure required data is always provided
------------------------------------------------------------

CREATE TABLE employees (
    employee_id NUMBER(6)
        CONSTRAINT employees_pk PRIMARY KEY,

    first_name VARCHAR2(20)
        CONSTRAINT employees_fname_nn NOT NULL,

    last_name VARCHAR2(25)
        CONSTRAINT employees_lname_nn NOT NULL,

    department_id NUMBER(4)
        CONSTRAINT employees_dept_nn NOT NULL,

    salary NUMBER(10,2)
        CONSTRAINT employees_salary_nn NOT NULL
);


------------------------------------------------------------
-- MODIFYING TABLE STRUCTURE USING ALTER TABLE
-- Add new columns to an existing table
-- Reflects changing requirements without recreating the table
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
-- CREATING A BASIC TABLE
-- Define columns and data types
------------------------------------------------------------

CREATE TABLE departments (
    department_id NUMBER(4),
    department_name VARCHAR2(30)
);


------------------------------------------------------------
-- Adding a FOREIGN KEY constraint
-- Enforce referential integrity between tables
------------------------------------------------------------

CREATE TABLE employees_fk (
    employee_id NUMBER(6)
        CONSTRAINT emp_fk_pk PRIMARY KEY,

    last_name VARCHAR2(25),

    department_id NUMBER(4),

    CONSTRAINT emp_dept_fk
        FOREIGN KEY (department_id)
        REFERENCES departments(department_id)
);


------------------------------------------------------------
-- Adding a CHECK constraint
-- Restrict values allowed in a column
------------------------------------------------------------

CREATE TABLE salaries (
    employee_id NUMBER(6),

    salary NUMBER(8,2)
        CONSTRAINT salary_chk CHECK (salary > 0)
);


------------------------------------------------------------
-- Using DEFAULT values
-- Automatically assign values when none are provided
------------------------------------------------------------

CREATE TABLE audit_log (
    log_id NUMBER(6)
        CONSTRAINT audit_pk PRIMARY KEY,

    action_date DATE DEFAULT SYSDATE,

    username VARCHAR2(30)
);


------------------------------------------------------------
-- Notes:
-- Constraints prevent invalid data from entering tables.
-- Meaningful constraint names improve readability and debugging.
-- Adding constraints after table creation is common in practice.
-- Good constraint design supports reliable querying later on.
------------------------------------------------------------


