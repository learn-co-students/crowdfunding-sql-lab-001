-- Select the titles of all projects and their pledge amounts.

SELECT project.title, SUM(pledge.amount) 
FROM project JOIN pledge 
ON project.id = pledge.project_id 
GROUP BY project.title;

-- Select the user name, age, and pledge amount for all pledges.

SELECT user.name, user.age, SUM(pledge.amount)
FROM user JOIN pledge
ON user.id = pledge.user_id
GROUP BY user.name;

-- Select the titles of all projects that have met their funding goal.

SELECT project.title, (project.funding_goal - SUM(pledge.amount)) AS amount_left
FROM project JOIN pledge
ON project.id = pledge.project_id
GROUP BY project.title
HAVING amount_left <= 0;

-- Select user names and amounts of all pledges. Order them by the amount.

SELECT user.name, SUM(pledge.amount)
FROM user JOIN pledge
ON user.id = pledge.user_id
GROUP BY user.name
ORDER BY SUM(pledge.amount);

-- Select the category names, and pledge amounts of all pledges in the music category.

SELECT project.category, pledge.amount
FROM project JOIN pledge
ON project.id = pledge.project_id
WHERE project.category = "music";

-- Select the category names and the sum total of the pledge amounts of all the pledges in the book category.

SELECT project.category, SUM(pledge.amount)
FROM project JOIN pledge
ON project.id = pledge.project_id
WHERE project.category = "books"
GROUP BY project.category;