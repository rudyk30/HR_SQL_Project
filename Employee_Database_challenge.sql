--Step 1
SELECT emp_no, first_name,last_name
FROM employees;

--Step 2
SELECT title, from_date, to_date
FROM titles;

--Step 3
SELECT e.emp_no,
	   e.first_name,
	   e.last_name,
	   ti.title,
	   ti.from_date,
	   ti.to_date
INTO Retirement_Titles
FROM employees as e
INNER JOIN titles as ti
ON (ti.emp_no = e.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;

--Step 8
-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title
INTO unique_titles
FROM retirement_titles
WHERE (to_date = '9999-01-01')
ORDER BY emp_no, to_date DESC;

--Step 9
SELECT COUNT(title) as title_count, 
title
INTO Retiring_Titles
FROM unique_titles 
GROUP BY title
ORDER BY title_count DESC;




SELECT COUNT(ce.emp_no),de.dept_no
INTO Employee_Dept
FROM current_emp as ce 
LEFT JOIN dept_emp as de 
ON ce.emp_no = de.emp_no
GROUP BY de.dept_no
ORDER BY de.dept_no;