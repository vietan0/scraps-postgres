/* manipulate */
CREATE FUNCTION get_all_boards(user_id uuid) RETURNS SETOF boards AS $$ -- SETOF is required to return multiple rows
SELECT *
FROM boards
WHERE board_id IN (
    -- get all board_ids of one user
    SELECT board_id
    FROM board_members
    WHERE user_id = $1
  ) $$ LANGUAGE SQL;

-- SELECT * FROM get_all_boards('6bb317fb-3c38-47d7-a6d7-b1b9e9a13dc1'::uuid);
-- SELECT * FROM lists;
SELECT *
FROM cards;

DROP FUNCTION IF EXISTS get_all_boards(uuid);