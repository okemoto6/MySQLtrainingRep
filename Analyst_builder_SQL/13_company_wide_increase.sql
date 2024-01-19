/*
Company Wide Increase

If our company hits its yearly targets, every employee receives a salary increase depending on what level you are in the company.

Give each Employee who is a level 1 a 10% increase, level 2 a 15% increase, and level 3 a 200% increase.

Include this new column in your output as "new_salary" along with your other columns.
*/

SELECT employee_id, pay_level, salary,
CASE
  WHEN pay_level = 1 THEN salary * 1.1
  WHEN pay_level = 2 THEN salary * 1.15  
  WHEN pay_level = 3 THEN salary * 3
  END AS 'new_salary'
FROM employees;
