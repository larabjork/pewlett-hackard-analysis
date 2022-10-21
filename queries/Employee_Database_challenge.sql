--Retrieve employee # and name (employees) and title, from/to dates (titles)
SELECT e.emp_no, e.first_name, e.last_name, t.title, t.from_date, t.to_date
INTO retirement_titles
FROM employees as e
JOIN titles as t ON t.emp_no = e.emp_no
WHERE e.birth_date >= '1952-01-01' AND e.birth_date <= '1955-12-31'
ORDER BY e.emp_no;

-- View table results before exporting to retirement_titles.csv
SELECT * FROM retirement_titles;

-- Remove duplicate entries from retirement_titles
SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
rt.first_name,
rt.last_name,
rt.title
INTO unique_titles
FROM retirement_titles as rt
WHERE rt.to_date = '9999-01-01'
ORDER BY rt.emp_no, rt.to_date DESC;

-- View table results before exporting to unique_titles.csv
SELECT * FROM unique_titles;

--Retrieve number of employees by most recent job title who are about to retire
SELECT COUNT (ut.title), ut.title
INTO retiring_titles
FROM unique_titles AS ut
GROUP BY ut.title
ORDER BY count DESC;

-- View table results before exporting to retiring_titles.csv
SELECT * FROM retiring_titles;

-- Create mentorship eligibility table
SELECT DISTINCT ON (e.emp_no) e.emp_no
	,e.first_name
	,e.last_name
	,e.birth_date
	,de.from_date
	,de.to_date
	,ti.title
INTO mentorship_eligibility	
FROM employees AS e
JOIN dept_emp AS de ON de.emp_no = e.emp_no
JOIN titles AS ti ON ti.emp_no = e.emp_no
WHERE de.to_date = '9999-01-01'
AND e.birth_date >= '1965-01-01'
AND e.birth_date <= '1965-12-31'
ORDER BY e.emp_no;

-- View table results before exporting to mentorship_eligibility.csv
SELECT * FROM mentorship_eligibility;
