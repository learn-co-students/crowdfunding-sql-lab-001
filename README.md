---
  tags: sql, database, WIP
  languages: ruby, sql
  resources: 0
---

# Croudfunding SQL Lab

Work in progress.




---
tags: template, SQL
language: ruby, SQL
resources: 0
---

# SQL Lab Template

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


# Crowdfunding SQL

## Objectives

Create the database, model the data, and use `JOIN`s to answer the questions.

## Create the database

You are going to make a database to store data for your crowd-funding platform. The platform needs to have projects, users, and pledges. 

**Create a schema based on the following information:**

- A project has a title, a category, a funding goal, a start date, and an end date. Valid categories are: music, books, charity.

- A user has a name and an age

- A pledge has an amount. It belongs to a user, and it also belongs to a project.

**Insert some records into the datbase**

Create 10 projects, 20 users, and 30 pledges.

## Questions

Answer the following questions with SQL. You'll use different kinds of SQL joins to arrive at the answers for most.

- Select the titles of all projects and their pledge amounts.

- Select the user name, age, and pledge amount for all pledges.

- Select the titles of all projects that have met their funding goal.

- Select user names and amounts of all pledges. Order them by the amount.

- Select the category names, and pledge amounts of all pledges in the music category.

- Select the category names and the **sum total** of the pledge amounts of all the pledges in the book category.


## Resources
* [Seldom Blog](http://blog.seldomatt.com/) - [About SQL Joins: The 3 Ring Binder Model](http://blog.seldomatt.com/blog/2012/10/17/about-sql-joins-the-3-ring-binder-model/)
* [Coding Horror](http://blog.codinghorror.com/) - [A Visual Explanation of SQL Joins](http://blog.codinghorror.com/a-visual-explanation-of-sql-joins/)
* [Geeky is Awesome](http://geekyisawesome.blogspot.com/) - [SQL Joins Tutorial](http://geekyisawesome.blogspot.com/2011/03/sql-joins-tutorial.html)
