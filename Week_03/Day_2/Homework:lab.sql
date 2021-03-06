/*Q1*/
SELECT 
e.first_name,
e.last_name,
t.name AS team_name
FROM employees AS e LEFT JOIN teams AS t
ON t.id = e.team_id;

/*Q1b*/
SELECT 
e.first_name,
e.last_name,
t.name AS team_name
FROM employees AS e LEFT JOIN teams AS t
ON t.id = e.team_id
WHERE e.pension_enrol = TRUE;

/*Q1c*/

SELECT 
e.first_name,
e.last_name,
t.name AS team_name
FROM employees AS e LEFT JOIN teams AS t
ON t.id = e.team_id
WHERE CAST(t.charge_cost AS INT4) > 80;
;

/*Q2*/
SELECT *
FROM employees AS e LEFT JOIN pay_details AS pd
ON e.pay_detail_id = pd.id;

/*Q2b*/
SELECT e.*,
pd.*,
t.name AS team_name
FROM employees AS e LEFT JOIN pay_details AS pd
ON e.pay_detail_id = pd.id
LEFT JOIN teams AS t
ON e.team_id = t.id;

/*Q3*/
SELECT
	e.id,
	t.name
FROM employees AS e LEFT JOIN teams AS t
ON e.team_id = t.id;

/*Q3b*/
SELECT
	t.name AS team_name,
	COUNT(t.name) AS num_employees
FROM employees AS e LEFT JOIN teams AS t
ON e.team_id = t.id 
GROUP BY team_name;

/*Q3c*/
SELECT
	t.name AS team_name,
	COUNT(t.name) AS num_employees
FROM employees AS e LEFT JOIN teams AS t
ON e.team_id = t.id 
GROUP BY team_name
ORDER BY num_employees ASC;

/*Q4*/
SELECT 
t.id, 
t.name,
COUNT(e.id)
FROM employees AS e INNER JOIN teams AS t 
ON t.id = e.team_id
GROUP BY t.id;

/*Q4b*/

SELECT 
  t.name,
  COUNT(e.id) * CAST(t.charge_cost AS INT) AS total_day_charge
FROM employees AS e
INNER JOIN teams AS t
ON e.team_id = t.id
GROUP BY t.id;

/*Q4c*/

SELECT 
  t.name,
  COUNT(e.id) * CAST(t.charge_cost AS INT) AS total_day_charge
FROM employees AS e
INNER JOIN teams AS t
ON e.team_id = t.id
GROUP BY t.id
HAVING COUNT(e.id) * CAST(t.charge_cost AS INT) > 5000;
