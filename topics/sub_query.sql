CREATE TABLE weather(
  city VARCHAR(80),
  temp_lo INT,
  temp_hi INT,
  prcp REAL,
  DATE DATE
);

INSERT INTO weather
VALUES ('San Francisco', 46, 50, 0.25, '1994-11-27'),
  ('San Francisco', 43, 57, 0.0, '1994-11-29'),
  ('Hayward', 54, 37, 0.1, '1994-11-29');

CREATE VIEW more_than_max AS
SELECT *
FROM weather
WHERE temp_hi > (
    SELECT max(temp_hi)
    FROM weather
  );

-- operators
SELECT EXISTS (
    SELECT *
    FROM more_than_max
  ) AS yeah;

DROP VIEW more_than_max;

DROP TABLE weather;