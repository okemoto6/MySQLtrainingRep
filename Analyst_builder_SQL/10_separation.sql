/*
Separation

Data was input incorrectly into the database. The ID was combined with the First Name.

Write a query to separate the ID and First Name into two separate columns.

Each ID is 5 characters long.
*/

SELECT SUBSTRING(id, 1, 5) as id, SUBSTRING(id, 6) as name
FROM bad_data LIMIT 10;

