CREATE USER admin;

ALTER USER admin WITH PASSWORD 'root';

GRANT CONNECT ON DATABASE test TO admin;

GRANT USAGE ON SCHEMA public TO admin;

GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO admin;

GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA public TO admin;

GRANT ALL PRIVILEGES ON DATABASE test TO admin;

ALTER USER admin CREATEDB;

ALTER USER admin WITH SUPERUSER;

-- Revoke

REVOKE DELETE ON users FROM admin;

SELECT * FROM pg_tables WHERE schemaname = 'public';


GRANT SELECT, UPDATE ON users TO admin;

GRANT SELECT, UPDATE ON orders TO admin;

REVOKE DELETE ON users FROM admin;

REVOKE DELETE ON orders FROM admin;


CREATE USER raj;

ALTER USER raj WITH PASSWORD 'tiger';

GRANT SELECT ON users TO raj;

REVOKE SELECT ON users FROM raj;


-- Triggers
-- it is a database callback function that automatically executes when specific database events (like INSERT, UPDATE, or DELETE) occur on a table.

CREATE OR REPLACE FUNCTION update_hire_date()
RETURNS TRIGGER AS $$
BEGIN
   NEW.hdate := CURRENT_DATE;
   RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER set_hire_date
BEFORE INSERT ON employees
FOR EACH ROW
EXECUTE FUNCTION update_hire_date();

INSERT INTO employees (fname, lname, dept, salary)
VALUES ('Alan', 'Turing', 'Research', 95000);

SELECT * FROM employees WHERE fname = 'Alan';



