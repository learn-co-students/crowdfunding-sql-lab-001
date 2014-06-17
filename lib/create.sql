CREATE TABLE project (
id INTEGER PRIMARY KEY,
title TEXT,
category TEXT,
funding_goal NUMERIC,
start_date TEXT,
end_date TEXT
)
;

CREATE TABLE user (
id INTEGER PRIMARY KEY,
name TEXT,
age TEXT
)
;

CREATE TABLE pledge (
id INTEGER PRIMARY KEY,
amount NUMERIC,
user_id INTEGER,
project_id INTEGER
)
;