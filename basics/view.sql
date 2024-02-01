CREATE TABLE IF NOT EXISTS weather(
  city VARCHAR(80),
  temp_lo INT,
  temp_hi INT,
  prcp REAL,
  DATE DATE
);

INSERT INTO weather
VALUES ('San Francisco', 46, 50, 0.25, '1994-11-27');

INSERT INTO weather (city, temp_lo, temp_hi, prcp, DATE)
VALUES ('San Francisco', 43, 57, 0.0, '1994-11-29');

INSERT INTO weather (DATE, city, temp_hi, temp_lo)
VALUES ('1994-11-29', 'Hayward', 54, 37);

-- save a query as a shorthand to reuse
create view countmax as
  select city, count(*), max(temp_hi)
  from weather
  group by city;

select * from countmax;

--
DROP VIEW IF EXISTS countmax;
DROP TABLE IF EXISTS weather;