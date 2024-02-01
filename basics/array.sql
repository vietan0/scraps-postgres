-- DROP TABLE IF EXISTS notes;

-- CREATE TABLE notes (
--   id int generated always AS identity PRIMARY KEY,
--   labels text []
-- );

-- INSERT INTO notes (labels)
-- VALUES (ARRAY['Cat', 'Dog', 'Bird']);

-- INSERT INTO notes (labels)
-- VALUES (ARRAY ['js', 'ts', 'xofa']);

-- UPDATE notes
-- SET labels = array_append(labels, 'react')
-- WHERE labels = (ARRAY['Cat', 'Dog', 'Bird']);
-- TABLE notes;

-- SELECT labels FROM notes;
-- SELECT labels[1] FROM notes;
-- SELECT labels[2:3] FROM notes;
-- SELECT array_dims(labels) FROM notes;