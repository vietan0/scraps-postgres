CREATE schema IF NOT EXISTS fruits;

CREATE TABLE IF NOT EXISTS fruits.bananas (length real, color text);

SELECT current_schema;
\d fruits.bananas;