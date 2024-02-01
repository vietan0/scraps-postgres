SELECT version();

SELECT NOW();

SELECT CURRENT_TIMESTAMP;

SELECT current_date;

SELECT current_time;

SELECT gen_random_uuid();

SELECT random();

SELECT user;

SELECT session_user;

SELECT current_database();

SELECT current_schema;

SELECT current_query();

SELECT *
FROM pg_user;

SELECT rolname
FROM pg_roles;

SELECT *
FROM pg_views;

SELECT pg_sleep(5); -- Pausing for 5 seconds

SELECT timezone('utc'::text, NOW());

SELECT char_length('hey');

SELECT typname
FROM pg_type;

SELECT array_append('{1, 2, 3}', 9);

SELECT array_length(array[1, 2, 3], 1);

-- list all functions in 'public' schema
SELECT proname AS function_name
FROM pg_proc
WHERE pronamespace = (
    SELECT oid
    FROM pg_namespace
    WHERE nspname = 'public'
  );

-- list all triggers
SELECT trigger_name AS name,
  event_object_table AS table,
  action_statement
FROM information_schema.triggers;

-- list all policies in 'table_name'
SELECT pol.polname AS policy_name,
  pol.polpermissive AS permissive,
  pol.polroles AS roles,
  CASE
    pol.polcmd
    WHEN 'r' THEN 'SELECT'
    WHEN 'a' THEN 'INSERT'
    WHEN 'w' THEN 'UPDATE'
    WHEN 'd' THEN 'DELETE'
    ELSE pol.polcmd
  END AS command,
  pgn.nspname AS schema_name,
  tbl.relname AS table_name
FROM pg_policy pol
  INNER JOIN pg_class tbl ON pol.polrelid = tbl.oid
  INNER JOIN pg_namespace pgn ON tbl.relnamespace = pgn.oid
WHERE tbl.relname = 'table_name';
