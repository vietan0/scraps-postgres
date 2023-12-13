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
CREATE FUNCTION sayhi() RETURNS void AS $$
DECLARE x employees %ROWTYPE;

BEGIN 
  FOR x IN SELECT * FROM employees LOOP
    RAISE NOTICE '% is % years old', x.name, x.age;
  END LOOP;
END;

$$ LANGUAGE plpgsql;

SELECT *
FROM sayhi();

--
DROP FUNCTION sayhi();
DROP TABLE employees;

-- in a range
do $$
begin
  for i in 1 .. 5 loop
    raise notice 'i is %', i;
  end loop;
end;
$$ language plpgsql;