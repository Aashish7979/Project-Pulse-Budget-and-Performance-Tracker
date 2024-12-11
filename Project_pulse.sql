SELECT * FROM employees; 
SELECT * FROM completed_projects; 
SELECT * FROM departments; 
SELECT * FROM Head_Shots; 
SELECT * FROM project_assignments; 
SELECT * FROM projects; 
SELECT * FROM upcoming_projects; 
------------------------------------------------------
--Project status

WITH project_status AS (
SELECT  
project_id,
project_name,
project_budget,
'upcoming' as status
FROM upcoming_projects
UNION ALL
SELECT  
project_id,
project_name,
project_budget,
'completed' as status
FROM completed_projects ) 



SELECT 
e.employee_id,
e.first_name,
e.last_name,
e.job_title, 
e.salary, 
d.Department_Name,
d.Department_Budget,
d.Department_Goals,
ps.project_budget,
pa.project_id,
ps.project_name, 
ps.status
FROM employees e
JOIN departments d
ON e.department_id = d.Department_ID
JOIN project_assignments pa
ON pa.employee_id = e.employee_id
JOIN project_status ps
ON ps.project_id = pa.project_id