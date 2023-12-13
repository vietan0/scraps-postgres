-- https://www.postgresql.org/docs/15/functions-conditional.html
CREATE TABLE clothes (width int PRIMARY KEY);

INSERT INTO clothes
VALUES (83),
  (90),
  (116);

CREATE VIEW getSize AS
SELECT width,
  CASE
    WHEN width > 104 THEN 'XXL'
    ELSE 'M'
  END AS size
FROM clothes;

SELECT *
FROM getSize;

DROP VIEW getSize;

DROP TABLE clothes;