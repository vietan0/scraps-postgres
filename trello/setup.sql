/* create tables */
CREATE TABLE IF NOT EXISTS users (
  id uuid NOT NULL UNIQUE DEFAULT gen_random_uuid() PRIMARY KEY
);
CREATE TABLE IF NOT EXISTS boards (
  board_id uuid NOT NULL DEFAULT gen_random_uuid (),
  private boolean NOT NULL DEFAULT false,
  created_at timestamp WITH time zone NOT NULL DEFAULT NOW(),
  name text NULL DEFAULT '''Untitled Board''::text'::text,
  background text NULL,
  CONSTRAINT boards_pkey PRIMARY KEY (board_id)
);
CREATE TABLE IF NOT EXISTS board_members (
  board_id uuid NOT NULL,
  user_id uuid NOT NULL,
  admin boolean NOT NULL DEFAULT false,
  CONSTRAINT board_members_pkey PRIMARY KEY (board_id, user_id),
  CONSTRAINT board_members_user_id_fkey FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE
);
CREATE TABLE lists (
  list_id uuid NOT NULL DEFAULT gen_random_uuid (),
  board_id uuid NOT NULL,
  name text NOT NULL DEFAULT ''::text,
  created_at timestamp WITH time zone NOT NULL DEFAULT NOW(),
  rank text NOT NULL,
  CONSTRAINT lists_pkey PRIMARY KEY (list_id),
  CONSTRAINT lists_board_id_fkey FOREIGN KEY (board_id) REFERENCES boards (board_id) ON DELETE CASCADE
);
CREATE TABLE cards (
  card_id uuid NOT NULL DEFAULT gen_random_uuid (),
  list_id uuid NOT NULL,
  title text NOT NULL DEFAULT ''::text,
  content text NOT NULL DEFAULT ''::text,
  rank text NOT NULL DEFAULT ''::text,
  created_at timestamp WITH time zone NOT NULL DEFAULT NOW(),
  CONSTRAINT cards_pkey PRIMARY KEY (card_id),
  CONSTRAINT cards_list_id_fkey FOREIGN KEY (list_id) REFERENCES lists (list_id) ON DELETE CASCADE
);

/* populate */
INSERT INTO boards (board_id, name)
VALUES (
    'bfb33b16-7b1b-4e5a-8b9f-a0a692fd7484',
    '1st Board'
  ),
  (
    '25c8df41-7d6e-4c2a-bca6-d7dc4ca69bac',
    '3rd Board'
  );
INSERT INTO users (id)
VALUES ('6bb317fb-3c38-47d7-a6d7-b1b9e9a13dc1'),
  ('d162711a-0cf0-41fe-aa11-74e5f1a66bb4');
INSERT INTO board_members (board_id, user_id)
VALUES (
    'bfb33b16-7b1b-4e5a-8b9f-a0a692fd7484',
    '6bb317fb-3c38-47d7-a6d7-b1b9e9a13dc1'
  ),
  (
    'e18ab9cd-cc87-4071-b500-c85bda00b2ec',
    'd162711a-0cf0-41fe-aa11-74e5f1a66bb4'
  ),
  (
    '25c8df41-7d6e-4c2a-bca6-d7dc4ca69bac',
    '6bb317fb-3c38-47d7-a6d7-b1b9e9a13dc1'
  );
INSERT INTO lists (list_id, board_id, name, rank)
VALUES (
  'f8767934-4318-43e0-894f-9ca4461c5958',
  'bfb33b16-7b1b-4e5a-8b9f-a0a692fd7484',
  'Over',
  '0|i0001d:'
), (
  'de475e2d-adbb-4701-9170-4c05e09ba912',
  'bfb33b16-7b1b-4e5a-8b9f-a0a692fd7484',
  'Active',
  '0|i00015:'
);
INSERT INTO cards (card_id, list_id, title, rank)
VALUES (
  '3727660c-a686-498a-9c67-fe952427360e',
  'de475e2d-adbb-4701-9170-4c05e09ba912',
  'card 2',
  '0|i0003b:'
), (
  '53895588-2610-47e2-a496-1df3efcfacf8',
  'de475e2d-adbb-4701-9170-4c05e09ba912',
  'card 1',
  '0|i0003j:'
);

