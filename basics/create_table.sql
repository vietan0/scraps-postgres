DROP TABLE IF EXISTS employees;

-- ways to define primary key
-- 1.
CREATE TABLE employees (
  product_no integer PRIMARY KEY,
  name text DEFAULT 'John'
);

-- 2.
CREATE TABLE employees (
  product_no integer,
  name text DEFAULT 'John',
  PRIMARY KEY (product_no)
);

-- 3. manually name constraint (default: "tablename_pkey")
CREATE TABLE employees (
  product_no integer,
  name text DEFAULT 'John',
  CONSTRAINT hey_now PRIMARY KEY (product_no)
);