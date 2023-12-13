CREATE TABLE if not exists cities (
  name text,
  population float,
  elevation int -- in feet
);

CREATE TABLE if not exists capitals (state char(2)) INHERITS (cities);

\d cities;
\d capitals;

DROP TABLE IF EXISTS cities,
capitals;