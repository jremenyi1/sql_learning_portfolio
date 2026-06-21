/*
Week 8 — Submission Evidence (SQL Practice Tasks)

Purpose:
This file contains SQL queries submitted for assessment
during Week 8 of my SQL learning programme.

The focus this week was on:
- creating and modifying tables
- applying constraints to enforce data integrity
- using aggregate functions and subqueries for comparison analysis

All SQL was written and tested using Oracle SQL (Oracle APEX).

============================================================
*/

------------------------------------------------------------
-- SUBMISSION ONE: Employee Salary Table and Comparison Query
------------------------------------------------------------

-- TASK OVERVIEW:
-- Create a table to store employee salary data.
-- Apply appropriate data types and constraints.
-- Modify the table to add additional columns.
-- Write a query to find employees whose salary is:
--   - higher than the average salary in their department
--   - lower than the highest salary in the company


------------------------------------------------------------
-- Create EMPLOYEES table
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
-- Modify table: add additional columns
------------------------------------------------------------

ALTER TABLE employees
ADD (
    email        VARCHAR2(100)
        CONSTRAINT employees_email_nn NOT NULL,

    phone_number VARCHAR2(20),

    hire_date    DATE
        CONSTRAINT employees_hdate_nn NOT NULL,

    bonus        NUMBER(8,2)
);


------------------------------------------------------------
-- Verify table structure
------------------------------------------------------------

DESCRIBE employees;


------------------------------------------------------------
-- Insert test data for validation
------------------------------------------------------------

INSERT INTO employees
VALUES (101, 'John',  'Smith',  10, 4000,
        'john.smith@company.com',  '555-1001', DATE '2021-01-15', 500);

INSERT INTO employees
VALUES (102, 'Alice', 'Brown',  10, 6000,
        'alice.brown@company.com', '555-1002', DATE '2020-03-20', 700);

INSERT INTO employees
VALUES (103, 'Mark',  'Taylor', 10, 8000,
        'mark.taylor@company.com', '555-1003', DATE '2019-06-10', 1000);

INSERT INTO employees
VALUES (201, 'Sara',  'Miller', 20, 3000,
        'sara.miller@company.com', '555-2001', DATE '2022-02-01', 300);

INSERT INTO employees
VALUES (202, 'David', 'Wilson', 20, 4500,
        'david.wilson@company.com','555-2002', DATE '2021-07-18', 400);

INSERT INTO employees
VALUES (301, 'Emma',  'Clark',  30, 9000,
        'emma.clark@company.com', '555-3001', DATE '2018-11-25', 1500);


------------------------------------------------------------
-- Salary comparison query
------------------------------------------------------------

-- Notes:
-- This query returns employees who earn more than the
-- average salary in their own department, but less than
-- the maximum salary across the company.

SELECT
    employee_id,
    first_name,
    last_name,
    department_id,
    salary
FROM employees e
WHERE salary > (
        SELECT AVG(salary)
        FROM employees
        WHERE department_id = e.department_id
    )
AND salary < (
        SELECT MAX(salary)
        FROM employees
    );


------------------------------------------------------------
-- SUBMISSION TWO: Departmental Salary Analysis
------------------------------------------------------------

-- TASK OVERVIEW:
-- Create a table to store departmental salary data.
-- Apply constraints and default values.
-- Modify the table structure using ALTER TABLE.
-- Write a query to find departments where the minimum
-- salary is higher than the company-wide average salary.


------------------------------------------------------------
-- Create DEPARTMENT_SALARIES table
------------------------------------------------------------

CREATE TABLE department_salaries (
    department_id NUMBER NOT NULL,
    salary        NUMBER(10,2) DEFAULT 0 NOT NULL
);


------------------------------------------------------------
-- Verify table structure
------------------------------------------------------------

DESCRIBE department_salaries;


------------------------------------------------------------
-- Modify table structure
------------------------------------------------------------

-- Change default salary value
ALTER TABLE department_salaries
MODIFY salary NUMBER(10,2) DEFAULT 1000;

-- Ensure salary values are positive
ALTER TABLE department_salaries
ADD CONSTRAINT chk_salary_positive
CHECK (salary > 0);

-- Add primary key column
ALTER TABLE department_salaries
ADD employee_id NUMBER(8)
    CONSTRAINT employee_pk PRIMARY KEY;


------------------------------------------------------------
-- Insert test data for validation
------------------------------------------------------------

INSERT INTO department_salaries VALUES (10, 3000, 90);
INSERT INTO department_salaries VALUES (10, 4000, 30);
INSERT INTO department_salaries VALUES (60, 10000, 50);
INSERT INTO department_salaries VALUES (20, 1500, 20);


------------------------------------------------------------
-- Departmental salary analysis query
------------------------------------------------------------

-- Notes:
-- This query returns departments where the minimum salary
-- is higher than the average salary across the entire table.

SELECT department_id
FROM department_salaries
GROUP BY department_id
HAVING MIN(salary) > (
    SELECT AVG(salary)
    FROM department_salaries
);