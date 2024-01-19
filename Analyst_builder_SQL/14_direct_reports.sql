/*
Direct Reports

Write a query to determine how many direct reports each Manager has.

Note: Managers will have "Manager" in their title.

Report the Manager ID, Manager Title, and the number of direct reports in your output.
*/

SELECT dr2.employee_id mngr_id, dr2.position mngr, COUNT(dr1.employee_id) AS direct_reports
FROM direct_reports dr1
JOIN direct_reports dr2
ON dr1.managers_id = dr2.employee_id
WHERE dr2.position != 'CTO'
GROUP BY mngr_id
