-- Indexing
-- It is a technique used to improve the performance of database queries 
-- by minimizing the data that needs to be scanned. 
-- An index is a database object that provides a faster pathway 
-- to locate specific rows in a table.

-- Types of Indexing

-- B-Tree Index

CREATE INDEX idx_employee_name ON employees (fname);

-- Hash Index

CREATE INDEX idx_employee_salary ON employees USING hash (salary);