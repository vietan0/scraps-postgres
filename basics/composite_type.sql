CREATE TYPE address AS (
  street TEXT,
  city TEXT,
  state TEXT,
  postal_code TEXT
);

CREATE TABLE Customers (
  id SERIAL PRIMARY KEY,
  name TEXT,
  home address
);

INSERT INTO Customers (name, home)
VALUES (
    'John Doe',
    ROW('123 Main St', 'Anytown', 'CA', '12345')
  );

SELECT id,
  name,
  (home).street,
  (home).city,
  (home).state,
  (home).postal_code
FROM Customers;

DROP TABLE Customers;

DROP TYPE address;