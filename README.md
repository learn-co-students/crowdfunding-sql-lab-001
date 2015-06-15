---
  tags: sql, database
  languages: ruby, sql
  resources: 3
---

# Crowdfunding SQL

## Objectives

Learn to create tables, insert data, and use `JOIN`s to answer the questions.

## Create Tables

In the `create.sql` file, model your tables. You should have a table for projects, users, and pledges.

**Create a schema based on the following information:**

- A project has a title, a category, a funding goal, a start date, and an end date.

- A user has a name and an age

- A pledge has an amount. It belongs to a user, and it also belongs to a project.

## Insert Records into Database

Within the `insert.sql` file, insert 10 projects, 20 users, and 30 pledges into the database.

## Queries

Write the following queries in SQL. You'll use different kinds of SQL joins to arrive at the answers for most. Write your queries in the `lib/sql_queries` file like the example below:
```ruby
def select_category_from_projects
"SELECT category FROM projects;"
end
```
 For this Q & A section, the database will be seeded with external data so don't expect it to reflect the data you added above.

- Select the titles of all projects and their pledge amounts.

- Select the user name, age, and pledge amount for all pledges.

- Select the titles of all projects that have met their funding goal.

- Select user names and amounts of all pledges gropued by name. Order them by the amount.

- Select the category names, and pledge amounts of all pledges in the music category.

- Select the category names and the **sum total** of the pledge amounts of all the pledges in the book category.


## Resources
* [Seldom Blog](http://blog.seldomatt.com/) - [About SQL Joins: The 3 Ring Binder Model](http://blog.seldomatt.com/blog/2012/10/17/about-sql-joins-the-3-ring-binder-model/)
* [Coding Horror](http://blog.codinghorror.com/) - [A Visual Explanation of SQL Joins](http://blog.codinghorror.com/a-visual-explanation-of-sql-joins/)
* [Geeky is Awesome](http://geekyisawesome.blogspot.com/) - [SQL Joins Tutorial](http://geekyisawesome.blogspot.com/2011/03/sql-joins-tutorial.html)
