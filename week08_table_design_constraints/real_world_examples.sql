/*
File: week08_real_world_examples.sql
Purpose: Real-world SQL examples demonstrating table design,
         constraints, aggregate validation, and correlated queries.
Week: 8
Source: Personal Week 8 notebook (Oracle SQL)
*/

------------------------------------------------------------
-- EXAMPLE 1: CREATING A TABLE WITH CONSTRAINTS
-- Ensures data integrity from the start
------------------------------------------------------------

CREATE TABLE employees (
    employee_id   NUMBER(6)
        CONSTRAINT employees_pk PRIMARY KEY,
    first_name    VARCHAR2(20)
        CONSTRAINT employees_fname_nn NOT NULL,
    last_name     VARCHAR2(25)
        CONSTRAINT employees_lname_nn NOT NULL,
    department_id NUMBER(4)
        CONSTRAINT employees_dept_nn NOT NULL,
    salary        NUMBER(10,2)
        CONSTRAINT employees_salary_nn NOT NULL
);

------------------------------------------------------------
-- EXAMPLE 2: MODIFYING TABLE STRUCTURE USING ALTER TABLE
-- Reflects changing requirements without recreating the table
------------------------------------------------------------

ALTER TABLE employees
ADD (
    email        VARCHAR2(100) CONSTRAINT employees_email_nn NOT NULL,
    phone_number VARCHAR2(20),
    hire_date    DATE CONSTRAINT employees_hdate_nn NOT NULL,
    bonus        NUMBER(8,2)
);

------------------------------------------------------------
-- EXAMPLE 3: VERIFYING TABLE STRUCTURE
-- Used to confirm columns and constraints are applied correctly
------------------------------------------------------------

DESCRIBE employees;

------------------------------------------------------------
-- EXAMPLE 4: INSERTING TEST DATA FOR VALIDATION
-- Controlled data allows manual verification of query logic
------------------------------------------------------------

INSERT INTO employees VALUES
(101, 'John',  'Smith',  10, 4000, 'john.smith@company.com',  '555-1001', DATE '2021-01-15', 500);

INSERT INTO employees VALUES
(102, 'Alice', 'Brown',  10, 6000, 'alice.brown@company.com', '555-1002', DATE '2020-03-20', 700);

INSERT INTO employees VALUES
(103, 'Mark',  'Taylor', 10, 8000, 'mark.taylor@company.com', '555-1003', DATE '2019-06-10', 1000);

INSERT INTO employees VALUES
(201, 'Sara',  'Miller', 20, 3000, 'sara.miller@company.com', '555-2001', DATE '2022-02-01', 300);

INSERT INTO employees VALUES
(202, 'David', 'Wilson', 20, 4500, 'david.wilson@company.com','555-2002', DATE '2021-07-18', 400);

INSERT INTO employees VALUES
(301, 'Emma',  'Clark',  30, 9000, 'emma.clark@company.com', '555-3001', DATE '2018-11-25', 1500);

------------------------------------------------------------
-- EXAMPLE 5: CORRELATED SUBQUERY FOR WITHIN-DEPARTMENT COMPARISON
-- Finds employees earning more than their department average
-- but less than the company-wide maximum salary
------------------------------------------------------------

SELECT employee_id,
       first_name,
       last_name,
       department_id,
       salary
FROM employees e
WHERE salary >
(
    SELECT AVG(salary)
    FROM employees
    WHERE department_id = e.department_id
)
AND salary <
(
    SELECT MAX(salary)
    FROM employees
);

------------------------------------------------------------
-- EXAMPLE 6: USING DEFAULT VALUES AND CHECK CONSTRAINTS
-- Prevents invalid data and supports consistent inserts
------------------------------------------------------------

CREATE TABLE department_salaries (
    department_id NUMBER(4) NOT NULL,
    salary        NUMBER(10,2) DEFAULT 0 NOT NULL
);

-- Change business rule: update default salary value
ALTER TABLE department_salaries
MODIFY salary NUMBER(10,2) DEFAULT 1000;

-- Enforce positive salary values at the database level
ALTER TABLE department_salaries
ADD CONSTRAINT chk_salary_positive CHECK (salary > 0);

-- Add a primary key column
ALTER TABLE department_salaries
ADD employee_id NUMBER(8)
CONSTRAINT employee_pk PRIMARY KEY;

------------------------------------------------------------
-- EXAMPLE 7: INSERTING DATA FOR AGGREGATE VALIDATION
-- Data chosen to allow manual calculation of averages and minimums
------------------------------------------------------------

INSERT INTO department_salaries VALUES (10, 3000, 90);
INSERT INTO department_salaries VALUES (10, 4000, 30);
INSERT INTO department_salaries VALUES (60, 10000, 50);
INSERT INTO department_salaries VALUES (20, 1500, 20);

------------------------------------------------------------
-- EXAMPLE 8: AGGREGATE QUERY WITH HAVING AND SUBQUERY
-- Identifies departments where the minimum salary
-- is higher than the company-wide average
------------------------------------------------------------

SELECT department_id
FROM department_salaries
GROUP BY department_id
HAVING MIN(salary) >
(
    SELECT AVG(salary)
    FROM department_salaries
);

------------------------------------------------------------
-- NOTES:
-- • Aggregates were manually calculated to validate correctness
-- • Constraints enforce business rules at the database level
-- • Examples reflect real workflows used in reporting and analysis
------------------------------------------------------------