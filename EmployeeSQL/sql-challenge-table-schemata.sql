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
	