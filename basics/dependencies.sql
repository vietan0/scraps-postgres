CREATE TYPE rainbow AS ENUM (
  'red',
  'orange',
  'yellow',
  'green',
  'blue',
  'purple'
);

CREATE TABLE my_colors (color rainbow, note text);

\dT;
\d my_colors;

DROP TABLE my_colors;

SELECT enum_range(NULL::rainbow);

DROP TYPE rainbow;