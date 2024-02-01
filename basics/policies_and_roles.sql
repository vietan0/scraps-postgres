-- setup
CREATE role teacher;

CREATE TABLE boards (board_id int PRIMARY KEY, name text);
CREATE TABLE lists (list_id int PRIMARY KEY, board_id int REFERENCES boards(board_id), name text);
CREATE TABLE board_members (board_id INT REFERENCES boards(board_id), user_id text);

INSERT INTO boards VALUES (1, 'First Board'), (2, 'Second Board');
INSERT INTO lists VALUES (100, 1, 'Active'), (101, 1, 'Over'), (102, 2, 'Ron Swanson');
INSERT INTO board_members VALUES (1, 'teacher'), (1, 'student'), (1, 'pirate');

ALTER TABLE board_members ENABLE ROW LEVEL SECURITY;
GRANT ALL ON boards, board_members, lists TO teacher;


-- main
CREATE POLICY "Enable read access for teachers"
  ON board_members
  FOR SELECT
  TO teacher
  USING (true);

CREATE POLICY "Enable insert, update for teachers"
  ON board_members
  FOR INSERT, UPDATE
  TO teacher
  WITH CHECK (true);

SET ROLE teacher;
-- \! cls

SELECT * FROM board_members WHERE (
  current_user = board_members.user_id
);





-- reset
SET ROLE NONE;
DROP POLICY IF EXISTS "Enable read access for teachers" ON board_members;
DROP POLICY IF EXISTS "Enable insert, update for teachers" ON board_members;
REVOKE ALL ON boards, board_members, lists FROM teacher;
DROP ROLE teacher;

DROP TABLE IF EXISTS lists;
DROP TABLE IF EXISTS board_members;
DROP TABLE IF EXISTS boards;