#Crowdfunding SQL Lab - Tutorial 
Learn to create tables, insert data, and use JOINs to answer the questions.

## Important Points
The main goal of this lab is to have students understand how `INNER JOIN` statements work to combine rows from two or more tables where the join condition is met. 

The order that this lab should be done in is:

Create Tables (create.sql) >> Insert Records into DB (insert.sql) >> Write SQL Queries (sql_queries.rb)

##Create Tables
Open the `create.sql` and create your tables here.
Remember, the basic structure of a SQL creat statement is:
```SQL
CREATE TABLE table_name(
column_name COLUMN_TYPE,
)
```

Once you have that run RSPEC to see what the columns should. Make the first table like that and then just create the other ones.
### Projects Table
The projects table should have a id column that is a primary key, a title and category which will both be text, a cfunding goal which will be an integer, and a start dane and end date, both of which should be text. 
```SQL
CREATE TABLE projects (
id INTEGER PRIMARY KEY,
title TEXT,
category TEXT,
funding_goal NUMERIC,
start_date TEXT,
end_date TEXT
);
```

### Users Table
The users table should only have two columns besides the id. A name (text) and an age (integer). 
```SQL
CREATE TABLE users (
id INTEGER PRIMARY KEY,
name TEXT,
age INTEGER
);
```

### Pledges Table
The pledges table will serve to bring both the project table and the user table together. It will have an id for itself. it will also have a numeric value for the amount. Besides these two columns it will contain a user_id, which should be the id of the user who made the pledge and a project_id which will be the pledged to project. 
```SQL
CREATE TABLE pledges (
id INTEGER PRIMARY KEY,
amount NUMERIC,
user_id INTEGER,
project_id INTEGER
);
```

##Insert Records
In this section we will seed the database! Run the spec to see what the requirements are for each table. 

The tests do not use the data that you will add here, so feel free to do whatever you want to the information you insert. 
### Insert Users
The spec requires 20 users. Write the SQL statement `INSERT INTO users (id, name, age) VALUES (1, 'Finnebar', 17),` and so on until you have 20. 
### Insert Projects
The spec requires 10 projects so this time just set up the base insert statement and then open irb, write the sql statement `INSERT INTO projects (id, title, category, funding_goal, start_date, end_date) VALUES (1, 'An Awesome Project', 'books', 120.00, 01-15-13, 12-15-15),`
### Insert Pledges
This table is a join table and should link the users table to the project table. In reality the user_id column and project_id column would need to respond. 
`INSERT INTO pledges (id, amount, user_id, project_id) VALUES (1, 120.00, 2, 7),` and then add the values as you see fit. 

## SQL Queries
The SQL queries in this lab are wrapped in Ruby methods in the `sql_queries.rb` file. 
Write the appropriate query as a string in each method to make the test pass. Each method in the page is named to correnspond with the function your sql query should perform. For more information look at the spec.
### Select the titles of all projects and their pledge amounts.
```"SELECT projects.title, SUM(pledges.amount) FROM projects JOIN pledges ON projects.id = pledges.project_id GROUP BY projects.title;"```
In this query we want to return project titles and the total amount of pledges made to those projects.  To do this we select the project titles and thes sum of the pledges amount grouped by the project titles. This sums the pledges for each group, in this case, each project title. Before we do that we join the projects table to the pledges table on `projects.id  = pledges.project_id` We join on this column because it is a common column between the pledges and projects tables.

### Select the user name, age, and pledge amount for all pledges 
 ```"SELECT users.name, users.age, SUM(pledges.amount) FROM users JOIN pledges ON users.id = pledges.user_id GROUP BY users.name;"```
Unlike the last query which joined projects and pledges this query requires you to join pledges and users, this time we join on `user.id = pledges.user_id`. Like before we do this because user_id is the column that relates pledges to users. We select the name and age from the user table and sum the pledge amount like we did before and this time we group on the unique column, in this case `users.name` which sums the pledge amount for each group.  
### Selects the titles of all projects that have met their funding goal

```"SELECT projects.title, (projects.funding_goal - SUM(pledges.amount)) AS amount_left FROM projects JOIN pledges ON projects.id = pledges.project_id GROUP BY projects.title HAVING amount_left <= 0;"```
This query is a little more difficult because it requires using a statemnt that we haven't taught you yet. First we select the projects title and then we take the projects.funding_goal and subtract the sum of the pledges for that project from that amount and assign it to `amount_left` using `AS`. We can now later use `amount_left` instead of writing our calculation out again. Once we group by projects.title our sum is complete and we can use `HAVING` instead of `WHERE` (which does not allow calculations like `SUM()` to write out condition which will limit our return values to projects having an `amount_left` less then or equal to zero. 

### Selects user names and amounts of all pledges grouped by name and orderd by amout. 
```"SELECT users.name, SUM(pledges.amount) FROM users JOIN pledges ON users.id = pledges.user_id GROUP BY users.name ORDER BY SUM(pledges.amount);"```
This query is very similar to `Select_the_user_name_age_and_pledge_amount_for_all_pledges` instead we just want the user name and sum of amounts. Everything is the same as last time, we select what we want and we join on the common column. However the difference is we need to order the columns. We are able to use an `ORDER BY` to order by whatever column we want, in this case `SUM(pledges.amount)`.

### Selects the category names and pledge amounts of all pledges in the music category
`"SELECT projects.category, pledges.amount FROM projects JOIN pledges ON projects.id = pledges.project_id WHERE projects.category = 'music';"`
We are again selecting the category name and pledge amounts for a specific category. We join pledges to projects on the same column we have been using but this time we also add a `WHERE` clause, we are able to use `WHERE` since we do not have any function, we only want projects where the category is music.

### Slects the category name and the sum total of all its pledges for the book category

  ```"SELECT projects.category, SUM(pledges.amount) FROM projects JOIN pledges ON projects.id = pledges.project_id WHERE projects.category = 'books' GROUP BY projects.category;"```
This query is similar to the last one except we want to get the sum of the amounts and we want it for books this time. So we select the category and the sum of amounts. We join pledges and projects on the same column again, we specify that we only want rows where the category is equal to books and then we group by category allowing us to sum up the pledges. 

##Take Away
In this lab we have done several different joins with different criteria and taking different data. You should feel comfortable with simple join tables now. 
