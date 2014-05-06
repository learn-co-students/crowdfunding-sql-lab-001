---
tags: template, SQL
language: ruby, SQL
---

# Basic Procedural App Template

## Structure

```bash
SQL-Lab-template/
├── bin
│   └── environment.rb
│   └── run.rb
│   └── sql_runner.rb
├── lib
│   └── sample.sql
├── spec
│   └── sample_spec.rb
│   └── spec_helper.rb
├── .rspec
├── Gemfile
├── Gemfile.lock
└── readme.md
```

## Usage

This template is for SQL labs, like [Quiz SQL](https://github.com/flatiron-school-curriculum/quiz-sql)

####You need to make the following changes

1. in `sql_runner.rb`, change the `sample.sql` to whatever the name of your SQL file is going to be. If you want multiple SQL files, add new methods with the new filenames, like:
```ruby
def execute_sample_sql
  sql = File.read('lib/sample.sql')
  execute_sql(sql)
end
```
1. update `run.rb` to run any sql runner methods you created in `sql_runner.rb`. Just run the methods like this: `sql_runner.execute_sample_sql`. 
1. Optionally in `run.rb` you can edit the name of your database file here: `db = SQLite3::Database.new('../db/lab_database.db')`

