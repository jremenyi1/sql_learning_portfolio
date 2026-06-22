/*
Week 8 — Production-Style SQL Script
Focus: Table design, constraints, schema evolution, and analytical queries
Platform: Oracle SQL (APEX)
Purpose: Interview-ready reference implementation
*/

------------------------------------------------------------
-- 1. CORE SCHEMA DESIGN
------------------------------------------------------------

CREATE TABLE departments (
    department_id   NUMBER(4) CONSTRAINT dept_pk PRIMARY KEY,
    department_name VARCHAR2(30)
);

CREATE TABLE employees (
    employee_id   NUMBER(6) CONSTRAINT emp_pk PRIMARY KEY,
    first_name    VARCHAR2(20) CONSTRAINT emp_fname_nn NOT NULL,
    last_name     VARCHAR2(25) CONSTRAINT emp_lname_nn NOT NULL,
    department_id NUMBER(4) CONSTRAINT emp_dept_nn NOT NULL,
    salary        NUMBER(10,2) CONSTRAINT emp_salary_nn NOT NULL
);

------------------------------------------------------------
-- 2. SCHEMA EVOLUTION (SIMULATED REAL-WORLD CHANGE)
------------------------------------------------------------

ALTER TABLE employees ADD (
    email        VARCHAR2(100) CONSTRAINT emp_email_nn NOT NULL,
    phone_number VARCHAR2(20),
    hire_date    DATE CONSTRAINT emp_hiredate_nn NOT NULL,
    bonus        NUMBER(8,2)
);

------------------------------------------------------------
-- 3. DATA INTEGRITY CONSTRAINTS (POST-CREATION)
------------------------------------------------------------

ALTER TABLE employees
ADD CONSTRAINT emp_salary_chk CHECK (salary > 0);

ALTER TABLE employees
ADD CONSTRAINT emp_email_uk UNIQUE (email);

ALTER TABLE employees
ADD CONSTRAINT emp_dept_fk
FOREIGN KEY (department_id)
REFERENCES departments(department_id);

------------------------------------------------------------
-- 4. SAMPLE DATA (MINIMAL, CONSISTENT TEST SET)
------------------------------------------------------------

INSERT INTO departments VALUES (10, 'Engineering');
INSERT INTO departments VALUES (20, 'HR');
INSERT INTO departments VALUES (30, 'Finance');

INSERT INTO employees VALUES
(101, 'John', 'Smith', 10, 4000,
 'john.smith@company.com', '555-1001', DATE '2021-01-15', 500);

INSERT INTO employees VALUES
(102, 'Alice', 'Brown', 10, 6000,
 'alice.brown@company.com', '555-1002', DATE '2020-03-20', 700);

INSERT INTO employees VALUES
(201, 'Sara', 'Miller', 20, 3000,
 'sara.miller@company.com', '555-2001', DATE '2022-02-01', 300);

INSERT INTO employees VALUES
(301, 'Emma', 'Clark', 30, 9000,
 'emma.clark@company.com', '555-3001', DATE '2018-11-25', 1500);

------------------------------------------------------------
-- 5. ANALYTICAL QUERIES (REAL-WORLD BUSINESS LOGIC)
------------------------------------------------------------

-- 5.1 Employees earning above department average
SELECT
    e.employee_id,
    e.first_name,
    e.last_name,
    e.department_id,
    e.salary
FROM employees e
WHERE e.salary > (
    SELECT AVG(e2.salary)
    FROM employees e2
    WHERE e2.department_id = e.department_id
);

-- 5.2 Employees below company max salary (outlier detection)
SELECT
    employee_id,
    first_name,
    last_name,
    salary
FROM employees
WHERE salary < (
    SELECT MAX(salary)
    FROM employees
);

-- 5.3 Department-level salary distribution
SELECT
    department_id,
    COUNT(*) AS employee_count,
    MIN(salary) AS min_salary,
    MAX(salary) AS max_salary,
    AVG(salary) AS avg_salary
FROM employees
GROUP BY department_id;

-- 5.4 Departments where minimum salary exceeds company average
SELECT
    department_id
FROM employees
GROUP BY department_id
HAVING MIN(salary) > (
    SELECT AVG(salary)
    FROM employees
);

------------------------------------------------------------
-- 6. SCHEMA MAINTENANCE EXAMPLES (CONDENSED)
------------------------------------------------------------

-- Rename column (schema evolution example)
ALTER TABLE employees RENAME COLUMN last_name TO surname;

-- Modify datatype safely (only widening shown)
ALTER TABLE employees MODIFY salary NUMBER(12,2);

-- Drop optional column (cleanup example)
ALTER TABLE employees DROP COLUMN phone_number;

------------------------------------------------------------
-- END OF SCRIPT
------------------------------------------------------------