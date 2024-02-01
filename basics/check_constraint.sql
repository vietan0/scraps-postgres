CREATE TABLE products (
  product_no int generated always AS identity PRIMARY KEY,
  name text,
  price numeric CHECK (price > 0),
  discounted_price numeric CHECK (discounted_price > 0),
  CHECK (price > discounted_price)
);

INSERT INTO products (name, price, discounted_price)
VALUES ('apple', 50, 25);

INSERT INTO products (name, price, discounted_price)
VALUES ('invalid_apple', -1, 25);

INSERT INTO products (name, price, discounted_price)
VALUES ('invalid_discount', 50, 51);

SELECT *
FROM products;

DROP TABLE IF EXISTS products;