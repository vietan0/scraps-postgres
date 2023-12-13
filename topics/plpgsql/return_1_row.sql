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
CREATE FUNCTION sayhi() RETURNS employees AS $$
DECLARE x employees%ROWTYPE;

BEGIN -- when command return 0 or 1 row,
-- INTO x assigns result to x
SELECT * INTO x FROM employees WHERE age > 30;

RETURN x;

END;

$$ LANGUAGE plpgsql;

SELECT *
FROM sayhi();

--
DROP FUNCTION sayhi();
DROP TABLE employees;