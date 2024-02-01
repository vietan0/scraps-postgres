CREATE TABLE employees (
  id serial PRIMARY KEY,
  name VARCHAR(255),
  age INT
);

INSERT INTO employees (name, age)
VALUES ('John', 25),
  ('Amber', 32),
  ('Matty', 20);

CREATE FUNCTION funky_duck() RETURNS TABLE(name text, now timestamptz) AS $$
  SELECT user AS name, NOW() AS now;
$$ LANGUAGE SQL;

SELECT * FROM funky_duck();

DROP FUNCTION funky_duck;

DROP TABLE employees;