CREATE TABLE employees (
  id serial PRIMARY KEY,
  name VARCHAR(255),
  age INT
);

INSERT INTO employees (name, age)
VALUES ('John', 25),
  ('Amber', 32),
  ('Matty', 20);

--
CREATE FUNCTION sayhi() RETURNS SETOF employees AS $$
DECLARE 
  my_cursor CURSOR FOR SELECT * FROM employees;
  x employees %ROWTYPE;
BEGIN 
  OPEN my_cursor;
    LOOP 
      FETCH my_cursor INTO x;
      EXIT WHEN NOT FOUND;
      -- Exit the loop when no more rows are available
      RETURN NEXT x;
    END LOOP;
  CLOSE my_cursor;
RETURN;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM sayhi();

--
DROP FUNCTION sayhi();
DROP TABLE employees;