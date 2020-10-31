-- (1) List the following details of each employee: number, name, sex, salary
SELECT Employees.emp_no, Employees.last_name, Employees.first_name, 
	Employees.gender, Salaries.salary
FROM Employees
INNER JOIN Salaries ON Employees.emp_no = Salaries.emp_no;

-- (2) List employees hired in 1986
SELECT first_name, last_name, hire_date FROM Employees
WHERE hire_date > '1985-12-31'
AND hire_date < '1987-01-01';

--(3) List the manager of each dept with this info: dept number, dept name, emp_no, name
SELECT Department_Manager.dept_no,
	Departments.dept_name, 
	Department_Manager.emp_no,
	Employees.last_name, 
	Employees.first_name
FROM Department_Manager
INNER JOIN Departments ON Department_Manager.dept_no = Departments.dept_no
INNER JOIN Employees ON Department_Manager.emp_no = Employees.emp_no;

--(4) List department of each employee with their: number, last, first name, and department name
SELECT Employees.emp_no,
	Employees.last_name, 
	Employees.first_name,
	Departments.dept_name
FROM Employees
INNER JOIN Department_Manager ON 
	Employees.emp_no = Department_Manager.emp_no
INNER JOIN Departments ON 
	Department_Manager.dept_no = Departments.dept_no;
	
--(5) List name and sex of employees with first name of "Hercules" and last initial "B"\
SELECT first_name, last_name, gender FROM Employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

--(6) List all employees in the sales department, include their employee number, name and department name
SELECT Employees.emp_no,
	Employees.last_name,
	Employees.first_name,
	Departments.dept_name
FROM Employees
JOIN Department_Employees ON 
	Employees.emp_no = Department_Employees.emp_no
INNER JOIN Departments ON 
	Department_Employees.dept_no = Departments.dept_no
WHERE dept_name = 'Sales';

--(7) List all employees in the sales and development departments, include emp_no, name, and dept_name
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM Employees AS e
Join Department_Employees ON e.emp_no = Department_Employees.emp_no
INNER JOIN Departments AS d ON 
	Department_Employees.dept_no = d.dept_no
WHERE dept_name = 'Sales' OR dept_name = 'Development';

--(8) In descending order, list frequency count of employee last names\
SELECT last_name, COUNT(last_name) FROM Employees
GROUP BY last_name
ORDER BY COUNT(last_name) DESC;
