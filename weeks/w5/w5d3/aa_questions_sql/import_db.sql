PRAGMA foreign_keys = ON;

CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  fname TEXT NOT NULL,
  lname TEXT NOT NULL
);

CREATE TABLE questions (
  id INTEGER PRIMARY KEY,
  title TEXT NOT NULL,
  body TEXT NOT NULL,
  author_id INTEGER NOT NULL,
  FOREIGN KEY (author_id) REFERENCES users(id)
);

CREATE TABLE question_follows ( 
  id INTEGER PRIMARY KEY,
  user_id INTEGER NOT NULL,
  question_id INTEGER NOT NULL,
  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)
);

CREATE TABLE replies (
  id INTEGER PRIMARY KEY,
  subject_id INTEGER NOT NULL,
  parent_id INTEGER,
  rep_author_id INTEGER NOT NULL,
  child_replies INTEGER,
  body TEXT NOT NULL,
  FOREIGN KEY (subject_id) REFERENCES questions(id),
  FOREIGN KEY (parent_id) REFERENCES replies(id),
  FOREIGN KEY (rep_author_id) REFERENCES users(id) 
  FOREIGN KEY (child_replies) REFERENCES replies(id)
);

CREATE TABLE question_likes (
  id INTEGER PRIMARY KEY,
  user_id INTEGER NOT NULL,
  question_id INTEGER NOT NULL,
  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)
);

INSERT INTO
  users(fname, lname)
VALUES 
  ('Cody', 'Niles'),
  ('Peter', 'Kim');

INSERT INTO
  questions(title, body, author_id)
VALUES
  ('BFS', 'What is the run time of BFS?', (SELECT id FROM users WHERE fname = 'Peter')),
  ('AAQ', 'Who came up this project? Alvin?', (SELECT id FROM users WHERE fname = 'Cody'));

INSERT INTO
  question_follows(user_id, question_id)
VALUES
((SELECT id FROM users WHERE fname = 'Peter' AND lname = 'Kim'), (SELECT id FROM questions WHERE title = 'AAQ')),
((SELECT id FROM users WHERE fname = 'Cody' AND lname = 'Niles'), (SELECT id FROM questions WHERE title = 'BFS'));

INSERT INTO
  replies(subject_id, parent_id, rep_author_id, body)
VALUES
  ((SELECT id FROM questions WHERE title = 'AAQ'), NULL, (SELECT id FROM users WHERE fname = 'Peter'), 'Not Alvin');

INSERT INTO
  replies(subject_id, parent_id, rep_author_id, body)
VALUES
  ((SELECT id FROM questions WHERE title = 'AAQ'), (SELECT id FROM replies WHERE id = 1), (SELECT id FROM users WHERE fname = 'Cody'), 'Thanks');


