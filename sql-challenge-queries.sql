drop table Employees;
drop table Departments;
drop table Department_Employees;
drop table Department_Manager;
drop table Salaries;
drop table Titles;

CREATE TABLE Employees (
	emp_no INT NOT NULL,
	title_id VARCHAR NOT NULL,
	birth_date date NOT NULL,
	first_name VARCHAR NOT NULL,
	last_name VARCHAR NOT NULL,
	gender VARCHAR NOT NULL,
	hire_date date NOT NULL,
	PRIMARY KEY (emp_no)
);

Select * from employees

CREATE TABLE Departments (
	dept_no VARCHAR NOT NULL,
	dept_name VARCHAR NOT NULL,
	PRIMARY KEY (dept_no)
);

Select * from departments

CREATE TABLE Department_Employees (
	emp_no INT NOT NULL,
	dept_no VARCHAR NOT NULL,
		FOREIGN KEY (emp_no) REFERENCES Employees(emp_no),
		FOREIGN KEY (dept_no) REFERENCES Departments (dept_no)
);

Select * from Department_Employees

Drop Table Department_Manager

CREATE TABLE Department_Manager (
	dept_no VARCHAR NOT NULL,
	emp_no INT NOT NULL,
		FOREIGN KEY (emp_no) REFERENCES Employees(emp_no),
		FOREIGN KEY (dept_no) REFERENCES Departments (dept_no)
);

CREATE TABLE Salaries (
	emp_no int NOT NULL,
		salary INTEGER Not NULL,
		FOREIGN KEY (emp_no) REFERENCES Employees(emp_no)
);

CREATE TABLE Titles (
	title_id VARCHAR NOT NULL,
	title VARCHAR NOT NULL,
	PRIMARY KEY (title_id)
	);
	
-- (1) List the following details of each employee: number, name, sex, salary
SELECT Employees.emp_no, Employees.last_name, Employees.first_name, 
	Employees.gender, Salaries.salary
FROM Employees
INNER JOIN Salaries ON Employees.emp_no = Salaries.emp_no;

-- (2) List employees hired in 1986
SELECT emp_no, first_name, last_name, hire_date FROM Employees
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
SELECT * FROM Employees
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
