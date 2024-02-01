DROP VIEW IF EXISTS countmax;

DROP TABLE IF EXISTS weather,
cities;

CREATE TABLE cities (
  name varchar(80) PRIMARY KEY,
  location point
);

CREATE TABLE weather (
  city varchar(80) REFERENCES cities(name),
  temp_lo int,
  temp_hi int,
  prcp real,
  date date
);

INSERT INTO weather
VALUES ('Berkeley', 45, 53, 0.0, '1994-11-28');

-- throws error because there's no foreign key 'Berkeley'
-- ERROR: insert or update ON TABLE "weather" violates FOREIGN KEY CONSTRAINT "weather_city_fkey" 
-- DETAIL: KEY (city) =(Berkeley) IS NOT present IN TABLE "cities".