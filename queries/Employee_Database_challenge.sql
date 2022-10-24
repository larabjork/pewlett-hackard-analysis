-- Retrieve employee # and name (employees) and title, from/to dates (titles)
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

-- View table results before exporting to retiring_titles.csv and taking screenshot
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

ADDITIONAL QUERIES

-- View mentorship eligibility info by title
SELECT COUNT (me.title), me.title
INTO mentor_eligible_titles
FROM mentorship_eligibility AS me
GROUP BY me.title
ORDER BY count DESC;

--View table results before exporting to mentor_eligible_titles.csv and taking screenshot
SELECT * FROM mentor_eligible_titles;

-- Add dept number to unique titles
SELECT DISTINCT ON (ut.emp_no) ut.emp_no, ut.first_name, ut.last_name, ut.title, de.dept_no
INTO title_v_dept
FROM unique_titles AS ut
JOIN dept_emp AS de ON de.emp_no = ut.emp_no
ORDER BY ut.emp_no, de.dept_no;

-- View table results before exporting to title_v_dept.csv
SELECT * FROM title_v_dept

-- Get count of retirees by dept
SELECT tvd.dept_no, d.dept_name, COUNT(tvd.dept_no) 
INTO ret_count_by_dept
FROM title_v_dept AS tvd
JOIN departments AS d ON d.dept_no = tvd.dept_no
GROUP BY tvd.dept_no, d.dept_name
ORDER BY count DESC;

-- View new table before exporting to ret_count_by_dept.csv and taking screenshot
SELECT * FROM ret_count_by_dept;

-- Change column name to be more specific
ALTER TABLE mentor_eligible_titles
RENAME COLUMN count TO mentee_count;

-- View updated table before exporting and taking screenshot
SELECT * FROM mentor_eligible_titles;

-- Find titles for retiring and mentorship eligibility
SELECT rt.title, rt.count, met.mentee_count
INTO count_retire_mentor_titles
FROM retiring_titles AS rt
JOIN mentor_eligible_titles AS met ON met.title = rt.title
ORDER BY rt.title;

-- View table results before exporting and taking screen shot
SELECT * FROM count_retire_mentor_titles;

-- Change column name to be more specific
ALTER TABLE count_retire_mentor_titles
RENAME COLUMN count TO ret_count;

-- View updated table
SELECT * FROM count_retire_mentor_titles;


