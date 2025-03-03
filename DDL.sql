-- DDL(data definition language)
-- Used to define an object in a database.

-- Create a table

CREATE TABLE employee (
    emp_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department VARCHAR(50),
    salary NUMERIC(10, 2),
    hire_date DATE
);

-- CREATE TABLE department (
--     dept_id SERIAL PRIMARY KEY,
--     dept_name VARCHAR(50)
-- );

-- Alter a table

ALTER TABLE employee ADD COLUMN email VARCHAR(100);

-- Truncate a table

TRUNCATE TABLE employee;

-- Drop a table

DROP TABLE employee.