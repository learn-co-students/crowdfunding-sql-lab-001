CREATE TABLE IF NOT EXISTS users (
  name text
  );

CREATE TABLE IF NOT EXISTS quizzes (
  name text
  );

CREATE TABLE IF NOT EXISTS questions (
  quiz_id integer
  );

CREATE TABLE IF NOT EXISTS options (
  correct integer, 
  question_id integer
  );

CREATE TABLE IF NOT EXISTS answers (
  user_id integer, 
  question_id, integer, 
  option_id integer
  );