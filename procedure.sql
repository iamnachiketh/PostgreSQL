CREATE OR REPLACE PROCEDURE update_salary_dept(
edept VARCHAR,
sal DECIMAL
)
AS $$
	BEGIN 
		UPDATE employees
		SET salary = salary * sal
		WHERE dept = edept;
	END
$$ LANGUAGE plpgsql


CALL update_salary_dept('IT', 0.5);

DROP PROCEDURE update_salary_dept;

SELECT * FROM employees;


CREATE OR REPLACE FUNCTION set_hdate_table()
RETURNS TRIGGER 
AS $$
BEGIN 
	NEW.hdate:=CURRENT_DATE;
	RETURN NEW;
END;
$$ LANGUAGE plpgsql;



CREATE TRIGGER SET_HDATE_EMPLOYEES
BEFORE INSERT ON employees
FOR EACH ROW 
EXECUTE FUNCTION set_hdate_table();


DROP TRIGGER display_emaployees
ON employees;


DROP FUNCTION display_table;


INSERT INTO employees VALUES (1, 'Steve', 'Pacman', 1223456, 'HR');




