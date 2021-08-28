-- DROP existing tables.
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS titles;

-- Create Tables
-- Titles
CREATE TABLE "titles" (
    "title_id" CHAR(5) NOT NULL PRIMARY KEY,
    "title" VARCHAR(35) NOT NULL
);
-- Employees
CREATE TABLE "employees" (
    "emp_no" INTEGER NOT NULL PRIMARY KEY,
    "emp_title_id" CHAR(5) NOT NULL,
    "birth_date" DATE,
    "first_name" VARCHAR(35) NOT NULL,
    "last_name" VARCHAR(35) NOT NULL,
    "sex" VARCHAR(1),
    "hire_date" DATE,
    FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);
-- Salaries 
CREATE TABLE "salaries" (
    "emp_no" INTEGER,
    "salary" FLOAT,
    FOREIGN KEY(emp_no) REFERENCES employees(emp_no)
);
-- Departments
CREATE TABLE "departments" (
    "dept_no" CHAR(4) NOT NULL PRIMARY KEY,
    "dept_name" VARCHAR(35) NOT NULL
);
-- Department Employees
CREATE TABLE "dept_emp" (
    "emp_no" INTEGER NOT NULL,
    "dept_no" CHAR(4) NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);
-- Department Managers
CREATE TABLE "dept_manager" (
    "dept_no" CHAR(4),
    "emp_no" INTEGER,
    FOREIGN KEY(emp_no) REFERENCES employees(emp_no),
    FOREIGN KEY(dept_no) REFERENCES departments(dept_no)
);

-- CHECK
SELECT * FROM titles;
SELECT * FROM employees;
SELECT * FROM salaries;
SELECT * FROM departments;
SELECT * FROM dept_emp;
SELECT * FROM dept_manager;