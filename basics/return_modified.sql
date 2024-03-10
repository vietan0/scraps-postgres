CREATE TABLE IF NOT EXISTS cities (
  id uuid DEFAULT gen_random_uuid(),
  name text UNIQUE,
  PRIMARY KEY(id)
);

-- insert into cities (name) values ('Hanoi') returning *;
-- UPDATE cities
-- SET name = 'Hanoy'
-- WHERE name = 'Hanoi'
-- RETURNING *;

delete from cities where name = 'Hanoy' returning *;

-- drop table cities;