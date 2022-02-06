-- 1. I want to know how many employees with each title were born after 1965-01-01.

SELECT e.birth_date AS "DOB", t.title AS "Title"
FROM employees e
ON e.emp_no = t.emp_no
WHERE birth_date>= 1965-01-01;

-- 2. I want to know the average salary per title.

SELECT t.title AS "Title", avg(s.salary) AS "Average Salary"
FROM titles t
INNER JOIN salaries s
ON s.emp_no = t.emp_no
GROUP BY t.title;

-- 3. How much money was spent on salary for the marketing department between the years 1990 and 1992?

SELECT d.dept_name AS "Department", sum(s.salary) AS "Salary"
FROM salaries s
INNER JOIN dept_emp de ON s.emp_no = de.emp_no
INNER JOIN departments d ON d.dept_no = de.dept_no
WHERE s.from_date>= '1990-01-01' AND s.to_date<= '1992-12-31' 
GROUP BY d.dept_name
HAVING dept_name= 'Marketing';



