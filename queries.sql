-- Data Analysis
-- List the employee number, last name, first name, sex, and salary of each employee.
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees AS e 
JOIN salaries AS s  ON s.emp_no = e.emp_no;


-- List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date >= '1986-01-01' AND hire_date < '1987-01-01'
ORDER BY hire_date;


-- List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT dm.dept_no, e.last_name, e.first_name, dm.emp_no, depart.dept_name 
FROM employees AS e
JOIN  dept_manager AS dm ON e.emp_no = dm.emp_no
JOIN departments AS depart ON depart.dept_no = dm.dept_no;
	

-- List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT de.dept_no, de.emp_no, e.last_name, e.first_name,  depart.dept_name 
FROM dept_emp AS de
JOIN  employees AS e ON e.emp_no = de.emp_no
JOIN departments AS depart ON depart.dept_no = de.dept_no;

-- List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT first_name, last_name, sex 
FROM employees 
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';


-- List each employee in the Sales department, including their employee number, last name, and first name.
SELECT e.emp_no, e.last_name, e.first_name, dp.dept_name
FROM employees AS e
JOIN dept_emp AS de ON e.emp_no = de.emp_no
JOIN departments AS dp ON de.dept_no = dp.dept_no
WHERE dp.dept_name = 'Sales'
ORDER BY e.emp_no;


-- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, dp.dept_name
FROM employees AS e
INNER JOIN dept_emp AS de ON e.emp_no = de.emp_no
INNER JOIN departments AS dp ON de.dept_no = dp.dept_no
WHERE dp.dept_name = 'Sales' OR  dp.dept_name = 'Development'
ORDER BY e.emp_no;


-- List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT last_name, COUNT(*) AS count
FROM employees
GROUP BY last_name
ORDER BY count DESC;

