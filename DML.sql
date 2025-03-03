-- DML(data manipulation language)
-- Sql language used to manipulate the data.

-- Insert into a table

INSERT INTO employees (fname, lname, dept, salary, hdate)
VALUES
('Alice', 'Johnson', 'HR', 60000, '2020-01-15'),
('Bob', 'Smith', 'IT', 80000, '2019-03-10'),
('Charlie', 'Brown', 'Finance', 75000, '2021-06-01'),
('Diana', 'Prince', 'IT', 85000, '2018-12-01'),
('Eve', 'Davis', 'HR', 62000, '2020-11-21');


INSERT INTO employees (fname, lname, dept, salary, hdate)
VALUES ('Frank', 'Castle', 'Security', 70000, '2022-01-10');

-- Update table values

UPDATE employees
SET salary = salary * 1.10
WHERE dept = 'IT';


-- Delete table values

DELETE FROM employees
WHERE lname = 'Castle';