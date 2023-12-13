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
CREATE FUNCTION sayhi() RETURNS text AS $$
-- x is a row, but has no predefined structure
DECLARE x RECORD;
BEGIN
  SELECT * INTO x FROM employees WHERE age > 30;
  RETURN x.name;
END;

$$ LANGUAGE plpgsql;

SELECT * FROM sayhi();

--
DROP FUNCTION sayhi();
DROP TABLE employees;