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

DECLARE x employees %ROWTYPE;
BEGIN 
  RETURN QUERY SELECT * FROM employees;
END;

$$ LANGUAGE plpgsql;

SELECT * FROM sayhi();
--

DROP FUNCTION sayhi();
DROP TABLE employees;