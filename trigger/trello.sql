-- CREATE TABLE IF NOT EXISTS users (
--   id uuid NOT NULL UNIQUE DEFAULT gen_random_uuid() PRIMARY KEY
-- );
-- CREATE TABLE IF NOT EXISTS boards (
--   board_id uuid NOT NULL DEFAULT gen_random_uuid (),
--   private boolean NOT NULL DEFAULT false,
--   created_at timestamp WITH time zone NOT NULL DEFAULT NOW(),
--   name text NULL DEFAULT '''Untitled Board''::text'::text,
--   background text NULL,
--   CONSTRAINT boards_pkey PRIMARY KEY (board_id)
-- );
-- CREATE TABLE IF NOT EXISTS board_members (
--   board_id uuid NOT NULL,
--   user_id uuid NOT NULL,
--   admin boolean NOT NULL DEFAULT false,
--   CONSTRAINT board_members_pkey PRIMARY KEY (board_id, user_id),
--   CONSTRAINT board_members_user_id_fkey FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE
-- );
-- INSERT INTO boards (board_id, name)
-- VALUES (
--     'bfb33b16-7b1b-4e5a-8b9f-a0a692fd7484',
--     '1st Board'
--   ),
--   (
--     '25c8df41-7d6e-4c2a-bca6-d7dc4ca69bac',
--     '3rd Board'
--   ),
--   (
--     'e18ab9cd-cc87-4071-b500-c85bda00b2ec',
--     'Ron''s Board'
--   );
-- INSERT INTO users (id)
-- VALUES ('6bb317fb-3c38-47d7-a6d7-b1b9e9a13dc1'),
--   ('d162711a-0cf0-41fe-aa11-74e5f1a66bb4');
-- INSERT INTO board_members (board_id, user_id)
-- VALUES (
--     'bfb33b16-7b1b-4e5a-8b9f-a0a692fd7484',
--     '6bb317fb-3c38-47d7-a6d7-b1b9e9a13dc1'
--   ),
--   (
--     'e18ab9cd-cc87-4071-b500-c85bda00b2ec',
--     'd162711a-0cf0-41fe-aa11-74e5f1a66bb4'
--   ),
--   (
--     '25c8df41-7d6e-4c2a-bca6-d7dc4ca69bac',
--     '6bb317fb-3c38-47d7-a6d7-b1b9e9a13dc1'
--   );

-- CREATE OR REPLACE FUNCTION get_all_boards(user_id uuid) RETURNS SETOF boards AS $$ -- SETOF is required to return multiple rows
-- SELECT *
-- FROM boards
-- WHERE board_id IN (
--     -- get all board_ids of one user
--     SELECT board_id
--     FROM board_members
--     WHERE user_id = $1
--   ) $$ LANGUAGE SQL;

CREATE FUNCTION add_admin_row() RETURNS trigger AS $$
  DECLARE 
    user_id uuid = '6bb317fb-3c38-47d7-a6d7-b1b9e9a13dc1';
  BEGIN
    INSERT INTO board_members VALUES (NEW.board_id, user_id, TRUE);
    RETURN NULL;
  END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER after_insert
  AFTER INSERT
  ON boards
  FOR EACH ROW
  EXECUTE FUNCTION add_admin_row();

SELECT name
FROM get_all_boards('6bb317fb-3c38-47d7-a6d7-b1b9e9a13dc1'::uuid);

INSERT INTO boards (name, background) VALUES ('Small Board', 'yellow');
TABLE boards;
TABLE board_members;

DROP FUNCTION add_admin_row() CASCADE;