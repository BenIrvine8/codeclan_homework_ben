/*MVP*/
/*Q1*/
SELECT 
COUNT(iban),
COUNT(local_account_no)
FROM pay_details
WHERE iban IS NULL AND local_account_no IS NULL
/* No */

/*Q2*/
SELECT 
	first_name,
	last_name,
	country
FROM employees 
ORDER BY country, last_name
NULLS LAST;

/*Q3*/

SELECT *
FROM employees
ORDER BY salary DESC
NULLS LAST
LIMIT 10;

/*Q4*/
SELECT
	first_name,
	last_name,
	salary
FROM employees 
WHERE country = 'Hungary'
ORDER BY salary ASC
LIMIT 1;

/*Q5*/
SELECT *
FROM employees 
WHERE email ILIKE '%yahoo%';

/*Q6*/
SELECT 
department AS department_name,
	COUNT(id) AS employee_count
FROM employees
GROUP BY department;

/*Q7*/
SELECT
	department,
	fte_hours,
	COUNT(id)
FROM employees 
GROUP BY fte_hours, department
ORDER BY department, fte_hours ASC;

/*Q8*/
SELECT
pension_enrol,
COUNT(id)
FROM employees
GROUP BY pension_enrol;

/*Q9*/
SELECT
MAX(salary)
FROM employees 
WHERE fte_hours = 1 AND department = 'Engineering';

/*Q10*/
SELECT
	country,
	COUNT(id) AS num_of_employees,
	AVG(salary) AS average_salary
FROM employees 
GROUP BY (country)
HAVING COUNT(id) > 30
ORDER BY average_salary DESC;


/*Q11*/
SELECT 
	first_name,
	last_name,
	fte_hours,
	salary,
	fte_hours * salary AS effective_yearly_salary
FROM employees;

/*Q12*/
SELECT 
	e.first_name,
	e.last_name
FROM employees AS e LEFT JOIN pay_details AS pd
	ON e.id = pd.id 
WHERE pd.local_tax_code IS NULL;

/*Q13*/
SELECT 
e.first_name,
e.last_name,
e.fte_hours,
e.salary,
(48 * 35 * CAST(t.charge_cost AS INT4) - salary) * fte_hours AS expected_profit
FROM employees AS e LEFT JOIN teams AS t
ON e.team_id = t.id;

/*Q14*/
SELECT 
department,
COUNT(id) AS no_name
FROM employees
WHERE first_name IS NULL 
GROUP BY department
HAVING COUNT(id) >= 2
ORDER BY no_name DESC, department ASC;

/*Q15*/

SELECT 
  first_name, 
  COUNT(id) AS name_count
FROM employees
WHERE first_name IS NOT NULL
GROUP BY first_name 
HAVING COUNT(id) > 1
ORDER BY COUNT(id) DESC, first_name ASC;


/*Q16*/
SELECT
 department, 
  SUM(CAST(grade = '1' AS INT)) / CAST(COUNT(id) AS REAL) AS grade_proportion 
FROM employees 
GROUP BY department;