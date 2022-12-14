-- Creating tables for PH-EmployeeDB
CREATE TABLE departments(
	dept_no VARCHAR(4) NOT NULL,
	dept_name VARCHAR(40) NOT NULL,
	PRIMARY KEY (dept_no),
	UNIQUE (dept_name)
); 

CREATE TABLE employees(
	emp_no INT NOT NULL,
	birth_date DATE NOT NULL,
	first_name VARCHAR NOT NULL,
	last_name VARCHAR NOT NULL,
	gender VARCHAR NOT NULL,
	hire_date DATE NOT NULL,
	PRIMARY KEY (emp_no)
);

CREATE TABLE dept_manager(
	dept_no VARCHAR(4) NOT NULL,
	emp_no INT NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
	PRIMARY KEY (emp_no, dept_no)
);

CREATE TABLE salaries(
	emp_no INT NOT NULL,
	salary INT NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	PRIMARY KEY (emp_no)
);

CREATE TABLE titles (
	emp_no INT NOT NULL,
	title varchar NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
);

CREATE TABLE dept_emp (
	emp_no INT NOT NULL,
	dept_no VARCHAR(4) NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
);



-- -- Employee count by dept number
-- SELECT COUNT(ce.emp_no), de.dept_no
-- FROM current_emp as ce
-- LEFT JOIN dept_emp as de
-- ON ce.emp_no = de.emp_no
-- GROUP BY de.dept_no
-- ORDER BY de.dept_no;

-- Employee count by dept number - saved in new table
-- CREATE TABLE retire_dept
-- AS
-- SELECT COUNT(ce.emp_no), de.dept_no
-- FROM current_emp as ce
-- LEFT JOIN dept_emp as de
-- ON ce.emp_no = de.emp_no
-- GROUP BY de.dept_no
-- ORDER BY de.dept_no;

-- SELECT * FROM retire_dept;

--List of potentially retiring employees with #, name, gender, and salary
-- SELECT em.emp_no
-- 	,em.first_name
-- 	,em.last_name
-- 	,em.gender
-- 	,sa.salary
-- 	,de.to_date
-- INTO emp_info
-- FROM employees as em
-- INNER JOIN salaries as sa
-- ON (em.emp_no = sa.emp_no)
-- INNER JOIN dept_emp as de
-- ON (em.emp_no = de.emp_no)
-- WHERE (em.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
-- AND (em.hire_date BETWEEN '1985-01-01' AND '1988-12-31')
-- AND (de.to_date = '9999-01-01');

-- SELECT * FROM current_emp

--List of managers, dept # and name, mgr employee #, name, start/end
-- SELECT dm.dept_no
-- 	,d.dept_name
-- 	,dm.emp_no
-- 	,ce.last_name
-- 	,ce.first_name
-- 	,dm.from_date
-- 	,dm.to_date
-- INTO manager_info
-- FROM dept_manager AS dm
-- 	INNER JOIN departments AS d
-- 		ON (dm.dept_no = d.dept_no)
-- 	INNER JOIN current_emp AS ce
-- 		ON (dm.emp_no = ce.emp_no);
		
--List of dept added to current_emp table
-- SELECT ce.emp_no
-- 	,ce.first_name
-- 	,ce.last_name
-- 	,d.dept_name
-- INTO dept_info
-- FROM current_emp AS ce
-- INNER JOIN dept_emp AS de
-- ON (ce.emp_no = de.emp_no)
-- INNER JOIN departments AS d
-- ON (de.dept_no = d.dept_no);

-- SELECT * FROM dept_info;

--Skill Drill - info for Sales team only
-- SELECT ri.emp_no
-- 	,ri.first_name
-- 	,ri.last_name
-- 	,d.dept_name
-- INTO sales_retire
-- FROM retirement_info AS ri
-- INNER JOIN dept_emp AS de
-- ON (ri.emp_no = de.emp_no)
-- INNER JOIN departments AS d
-- ON (de.dept_no = d.dept_no)
-- WHERE d.dept_name = 'Sales';

--Skill Drill - info for Sales and Development teams
-- SELECT ri.emp_no
-- 	,ri.first_name
-- 	,ri.last_name
-- 	,d.dept_name
-- INTO sales_dev_retire
-- FROM retirement_info AS ri
-- INNER JOIN dept_emp AS de
-- ON (ri.emp_no = de.emp_no)
-- INNER JOIN departments AS d
-- ON (de.dept_no = d.dept_no)
-- WHERE d.dept_name IN ('Sales', 'Development');

-- SELECT * FROM sales_dev_retire;