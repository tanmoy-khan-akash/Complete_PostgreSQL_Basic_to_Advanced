
--- DATABASE CREATE 
CREATE DATABASE teacher_db;

--- SCHEMA CREATE 
CREATE SCHEMA teacher;

--- TABLE CREATE
CREATE TABLE teacher.teacher_table
(
	id SERIAL PRIMARY KEY,
	teacher_name VARCHAR,
	course_name VARCHAR,
	duration VARCHAR,
	seat int
);

--- VALUE INSERT
INSERT INTO teacher.teacher_table (teacher_name, course_name, duration, seat)
VALUES
('Taniya Afrin', 'Data Science', '4 Months', 30),
('Shakil Ahmed', 'Accounting', '5 Months', 30),
('Monish Mojumder', 'ICT', '2 Months', 25),
('Swarna Siddika', 'Python', '3 Months', 20),
('Tanmoy Khan', 'Machine Learning', '3 Months', 25);

SELECT * FROM teacher.teacher_table;

--- UPDATE TABLE DATA
UPDATE teacher.teacher_table
SET course_name = 'Finance'
WHERE id =2;

UPDATE teacher.teacher_table
SET teacher_name = 'Usha Khan'
WHERE id =3;

--- DELETE TABLE DATA
DELETE FROM teacher.teacher_table
WHERE id = 2;

SELECT * FROM teacher.teacher_table;


--- --- DATA TYPE
--- NUMERIC DATA TYPE (SERIAL, INTEGER = INT, DECIMAL / NUMERIC)
--- CHARACTER DATA TYPE (VARCHAR, TEXT)
--- DATE & TIME (DATE, TIME, TIMESTAMP, TIMESTAMPTZ)
--- BOOLEAN & SPECIAL (BOOLEAN, UUID, JSON / JSONB)


--- TABLE CREATE
CREATE TABLE teacher.khan_academy
(
	id SERIAL PRIMARY KEY,
	teacher_name VARCHAR NOT NULL,
	course_name VARCHAR NOT NULL,
	duration_month INT NOT NULL,
	seat INT NOT NULL,
	time_add TIMESTAMP DEFAULT NOW()
);

--- VALUE INSERT
INSERT INTO teacher.khan_academy (teacher_name, course_name, duration_month, seat)
VALUES
('Fahim Ahmed', 'Data Science', 4, 25),
('Moinul Sharif', 'English', 3, 30),
('Naim Molla', 'Accounting', 3, 25),
('Usha Khan', 'Higher Math', 3, 20),
('Tanmoy Khan', 'Machine Learning', 2, 20);

SELECT * FROM teacher.khan_academy;



--- TABLE CREATE
CREATE TABLE teacher.students
(
	student_id SERIAL PRIMARY KEY,
	name VARCHAR,
	age INT,
	course VARCHAR,
	gpa NUMERIC
);

--- VALUE INSERT
INSERT INTO teacher.students (name, age, course, gpa)
VALUES
('Alif Hasan', 20, 'English', NULL),
('Usha Khan', 20, 'English', 3.80),
('Tanmoy Khan', 30, 'Data Science', 3.75),
('Taniya Afrin', 32, 'Accounting', 3.28),
('Obonti Saha', 25, 'Math', 3.88),
('Orin Iqbal', 28, 'Deep Learning', 3.62),
('Anika Akter', 18, 'Law', 3.25),
('Alif Hasan', 20, 'English', NULL);

SELECT * FROM teacher.students;


--- --- --- SQL CLAUSE 
--- FROM  CLAUSE 
SELECT * FROM teacher.students;

--- WHERE CLAUSE 
SELECT * FROM teacher.students WHERE gpa > 3.50;

--- GROUP BY CLAUSE 


--- HAVING CLAUSE 



--- ORDER BY CLAUSE 
SELECT * FROM teacher.students WHERE gpa > 3.50 ORDER BY gpa DESC;

SELECT * FROM teacher.students ORDER BY age DESC;

--- LIMIT CLAUSE
SELECT * FROM teacher.students LIMIT 3;

--- DISTINCT 
SELECT DISTINCT course FROM teacher.students;

--- LIKE
SELECT * FROM teacher.students WHERE name LIKE 'T%';


SELECT
stu.student_name, stu.email
FROM teacher.students_1to1 AS stu
WHERE stu.email ~*'@';


SELECT
stu.student_name, stu.email
FROM teacher.students_1to1 AS stu
WHERE stu.email ~*'.com$';


--- 
SELECT 
stu.name,
POSITION('oy' IN stu.name) 	-- 5 no position theke ace
FROM teacher.students AS stu;







--- --- --- RELATIONAL OPERATOR, LOGICAL OPERATOR & SPECIAL OPERATOR  
		--- (WHERE CLAUSE MUST BE)
		
--- --- RELATIONAL OPERATOR (=, !=, >, <, >=, <=)
--- EQUAL TO
SELECT * FROM teacher.students
WHERE age = 25;

SELECT * FROM teacher.students
WHERE course = 'Data Science';

--- NOT EQUAL TO
SELECT * FROM teacher.students
WHERE age != 25;

SELECT * FROM teacher.students
WHERE course = 'Data Science';

--- GREATER THAN
SELECT * FROM teacher.students
WHERE age > 28;

--- LESS THAN
SELECT * FROM teacher.students
WHERE age < 28;

--- GREATER THAN EQUAL TO
SELECT * FROM teacher.students
WHERE gpa >= 3.75;

--- GREATER THAN EQUAL TO
SELECT * FROM teacher.students
WHERE gpa <= 3.75;




--- --- LOGICAL OPERATOR (AND / &, OR / ||, NOT / !, NOT BETWEEN, BETWEEN = 																  --- Range Check)
--- AND (&)
SELECT * FROM teacher.students
WHERE course = 'English'
AND gpa >= 3.95;

SELECT * FROM teacher.students
WHERE course = 'Data Science'
AND gpa >= 3.75;

--- OR (||)
SELECT * FROM teacher.students
WHERE course = 'Data Science'
OR gpa >= 3.75;

--- NOT 
SELECT * FROM teacher.students
WHERE NOT course = 'Data Science';

--- BETWEEN 
SELECT * FROM teacher.students
WHERE age 
BETWEEN 25 AND 30;

--- NOT BETWEEN 
SELECT * FROM teacher.students
WHERE age 
NOT BETWEEN 25 AND 30;




--- --- SPECIAL OPERATOR (IN = List Match)
--- IN 
SELECT * FROM teacher.students
WHERE course
IN ('Accounting', 'ML');

--- NOT NULL 
SELECT * FROM teacher.students
WHERE age IS NOT NULL;

--- NULL 
SELECT * FROM teacher.students
WHERE age IS NULL;

SELECT * FROM teacher.students
WHERE gpa IS NULL;




--- --- AGGREGATE FUNCTION (COUNT, SUM, AVG, MAX, MIN, ROUND)
--- COUNT 
SELECT COUNT(name) FROM teacher.students;

SELECT COUNT(name) AS total_students FROM teacher.students;

SELECT COUNT(course) AS english_course FROM teacher.students 
WHERE course = 'English';

SELECT COUNT(*) AS total_students FROM teacher.students;

--- SUM 
SELECT SUM(age) FROM teacher.students;

SELECT SUM(age) AS total_age FROM teacher.students;

SELECT SUM(gpa) AS gpa FROM teacher.students;

--- AVG 
SELECT AVG(age) FROM teacher.students;

SELECT AVG(age) AS avg_age FROM teacher.students;

SELECT AVG(gpa) AS avg_gpa FROM teacher.students;

--- MAX 
SELECT MAX(age) FROM teacher.students;

SELECT MAX(age) AS oldest FROM teacher.students;

SELECT MAX(gpa) AS height FROM teacher.students;

---MIN 
SELECT MIN(age) AS young FROM teacher.students;

SELECT MIN(gpa) AS height FROM teacher.students;

--- ROUND 
SELECT ROUND(gpa, 3) FROM teacher.students;

SELECT ROUND(AVG(gpa), 1) AS avg_age FROM teacher.students;

SELECT ROUND(AVG(gpa), 2) AS avg_age FROM teacher.students;

-- 
SELECT 
stu.name,
stu.gpa,
LPAD(stu.gpa::VARCHAR, 7, 'x'),
RPAD(stu.gpa::VARCHAR, 7, '*')
FROM teacher.students AS stu;



--- ALL 5 FUNCTION IN ONE QUERY 
SELECT 
COUNT(*) AS total,
SUM(age) AS sum_age,
ROUND(AVG(gpa), 4) AS avg_gpa,
MAX(gpa) AS top_gpa,
MIN(age) AS youngest
FROM teacher.students;


--- GROUP BY 
SELECT 
COUNT(*) AS student_count,
ROUND(AVG(gpa), 2) AS avg_gpa
FROM teacher.students
GROUP BY course;


SELECT course, COUNT(*) AS students_count, ROUND(AVG(gpa), 2) AS avg_gpa
FROM teacher.students GROUP BY course;


--- HAVING 
SELECT course, 
AVG(gpa)
FROM teacher.students 
GROUP BY course 
HAVING AVG(gpa) > 3.75;



--- --- --- STRING FUNCTION 
SELECT * FROM teacher.students;

--- CONCAT (Used for pairing) 
SELECT
	name,
	CONCAT(name, ' is studing ', course) AS students_indo
FROM
	teacher.students;

-- OR, 
SELECT
CONCAT(cus.first_name, ' ', cus.last_name)
FROM teacher.customer AS cus;

-- OR,
SELECT
cus.first_name || ' ' || cus.last_name
FROM teacher.customer AS cus;


--- LOWER CASE
SELECT name, LOWER(name) AS name_upper FROM teacher.students;

--- UPPER CASE 
SELECT name, UPPER(name) AS name_upper FROM teacher.students;

---
SELECT name, Upper(name) AS name_upper, Upper(name) AS name_upper FROM teacher.students;


--- LENGTH 
SELECT name, course, LENGTH(name) AS name_len, LENGTH(course) AS course_len FROM teacher.students;

-- OR, 
SELECT
cus.first_name, 
LENGTH(cus.first_name)
FROM teacher.customer AS cus;


--- --- SUBSTRING 
SELECT name, SUBSTRING(name, 1, 3) AS first_3, SUBSTRING(course, 1, 5) AS first_5 FROM teacher.students;

-- OR, 
SELECT
cus.first_name, 
LEFT(cus.first_name, 2),
RIGHT(cus.first_name, 2)
FROM teacher.customer AS cus;

-- 
SELECT
cus.first_name, 
LENGTH(LEFT(cus.first_name, 2)),
RIGHT(cus.first_name, 2)
FROM teacher.customer AS cus;



--- REPLACE 
SELECT name, course, 
REPLACE(course, 'Law', 'Machine Learning') AS update_course 
FROM teacher.students;

SELECT name, course, 
REPLACE(course, 'Law', 'Machine Learning') AS update_course 
FROM teacher.students 
WHERE course = 'Law';

-- OR, 
SELECT 
stu.name,
REPLACE(stu.name, 'T', 'A')
FROM teacher.students AS stu;



--- TRIM (Removes whitespace from the beginning and end of the string) 
SELECT 
	'   Usha     ' AS new_name,
	TRIM('   Usha     ') AS trimed
	
--- LEFT TRIM
SELECT 
	'   Usha     ' AS new_name,
	TRIM('   Usha     ') AS trimed,
	LTRIM('   Usha     ') AS left_trim

--- RIGHT TRIM
SELECT 
	'   Usha     ' AS new_name,
	TRIM('   Usha     ') AS trimed,
	RTRIM('   Usha     ') AS right_trim
	
--- LEFT & RIGHT TRIM
SELECT 
	'   Usha     ' AS new_name,
	TRIM('   Usha     ') AS trimed,
	LTRIM('   Usha     ') AS left_trim,
	RTRIM('   Usha     ') AS right_trim
	





--- --- USER INPUT 	--- (GO TO PRACTICE pgAdmin4/DBever)
SELECT
* 
LOWER(cus.first_name),
UPPER(cus.first_name)
FROM teacher.customer AS cus
where LOWER(last_name) = LOWER($ user_input);

SELECT
* 
FROM teacher.customer AS cus
where LOWER(last_name) = LOWER($ user_input);

SELECT
* 
FROM teacher.customer AS cus
where UPPER(last_name) = UPPER($ user_input);



--- --- IF HAVAE 	--- (GO TO PRACTICE pgAdmin4/DBever)
--- +8801623868786
--- 8801623868786
--- 01623868786
--- 1623868786 	-- IDEAL
--- 1623-868786

SELECT
$input_phone,
TRIM('880' FROM CASE($input_phone AS VARCHAR));



--- --- 
--- WHEN WE WANT TO SEE DATE, +/-
SELECT 
NOW(), 
CURRENT_TIMESTAMP,
CURRENT_DATE,
NOW()::DATE,
NOW() - INTERVAL '10 YEARS',
NOW()::DATE - INTERVAL '10 YEARS',
NOW() + INTERVAL '10 MONTH',
NOW() + INTERVAL '2 WEEK';







--- --- --- ALTER (Existing Table Name Change, Existing Table ADD COLUMN, Existing Table COLUMN DELETE) / Means that, TABLE MODIFY

SELECT * FROM teacher.students;

--- COLUMN ADD 
ALTER TABLE teacher.students
ADD COLUMN email VARCHAR;

ALTER TABLE teacher.students
ADD COLUMN enrolled_date DATE DEFAULT CURRENT_DATE;


INSERT INTO teacher.students 
(name, age, course, gpa, email)
VALUES
('Sinthiya Tanzila', 28, 'EEE', 3.66, 'sinthiya.tanzila@gmail.com');

--- DROP COLUMN
ALTER TABLE teacher.students 
DROP COLUMN email;


SELECT * FROM teacher.students;

--- COLUMN RENAME
ALTER TABLE teacher.students
RENAME COLUMN name TO students_name;


ALTER TABLE teacher.students
RENAME COLUMN students_name to name;

--- RENAME TABLE NAME
ALTER TABLE teacher.students
RENAME TO learner;

SELECT * FROM teacher.learner;


ALTER TABLE teacher.learner
RENAME TO students;

SELECT * FROM teacher.students;


--- CHECK CONSTRAINT 
ALTER TABLE teacher.students
ADD CONSTRAINT chk_age CHECK (age >= 18 AND age <=35);


ALTER TABLE teacher.students
ADD CONSTRAINT chk_gpa CHECK (gpa >= 3.20 AND gpa <= 4.00);

SELECT * FROM teacher.students;

-- IF we can value insert & then see 
INSERT INTO teacher.students 
(name, age, course, gpa)
VALUES
('Sinthiya Tanzila', 26, 'EEE', 4.00);


-- WHEN CREATE TABLE teacher.students_info THAT TIME WE USE CHECK CONSTRAINT, LIKE THAT BELOW

-- CREATE TABLE teacher.students_info
-- 		stu_id 	SERIAL PRIMARY KEY,
-- 		name 	VARCHAR,
-- 		age 	INT 		CHECK (age >= 18 AND age <= 35);






SELECT * FROM teacher.students;


--- --- --- RELATIONSHIP QUERY FOREIGN KEY (FK) 
--- --- ONE TO ONE (1 : 1)
--- --- ONE TO MANY (1 : MANY)
--- --- MANY TO MANY (MANY : MANY) 



--- --- ONE TO ONE (1 : 1) (Table A, 1 Row & Table B, 1 Row Connection)
--- CREATE TABLE 1:1 (TABLE A) 
CREATE TABLE teacher.students_1to1
(
	student_id SERIAL PRIMARY KEY,
	student_name VARCHAR NOT NULL,
	email VARCHAR
);

--- VALUE INSERT
INSERT INTO teacher.students_1to1 (student_name, email)
VALUES
('Sakib Sheikh', 'sakib.sheikh@gmail.com'),
('Iqbal Sharif', 'iqbal.sharif@gmail.com'),
('Abir Hasan', 'abir.hasan@gmail.com'),
('Rahi Karim', 'rahi.karim@gmail.com'),
('Tanmoy Khan', 'tanmoy.khan@gmail.com'),
('Usha Khan', 'usha.khan@gmail.com');

SELECT * FROM teacher.students_1to1;


--- CREATE TABLE 1:1 (TABLE B)
CREATE TABLE teacher.students_profile
(
	profile_id SERIAL PRIMARY KEY,
	student_id INT UNIQUE NOT NULL, 		-- UNIQUE = 1:1 enforce 
	bio TEXT,
	linkedin VARCHAR,
	FOREIGN KEY (student_id) REFERENCES teacher.students_1to1(student_id) ON DELETE CASCADE
);

--- VALUE INSERT
INSERT INTO teacher.students_profile (student_id, bio, linkedin)
VALUES
(1, 'loves English course', 'linkedin.com/in/sakibsheikh'),
(2, 'loves EEE course', 'linkedin.com/in/iqbalsharif'),
(3, 'loves Data Science course', 'linkedin.com/in/abirhasan'),
(4, 'loves Deep Learning course', 'linkedin.com/in/rahikarim'),
(5, 'loves English course', 'linkedin.com/in/tanmoy-khan'),
(6, 'loves EEE course', 'linkedin.com/in/usha-khan');

SELECT * FROM teacher.students_profile;





--- --- ONE TO MANY (1 : MANY)
--- CREATE TABLE 1 
CREATE TABLE teacher.course
(
	course_id SERIAL PRIMARY KEY,
	course_name VARCHAR NOT NULL,
	teacher VARCHAR NOT NULL
);

--- VALUE INSERT
INSERT INTO teacher.course (course_name, teacher)
VALUES
('Data Science', 'Nazmus Sakib'),
('Deep Learning', 'Orin Iqbal'),
('English', 'Ashik Rahman'),
('EEE', 'Sinthiya Tanzila');

SELECT * FROM teacher.course;

--- CREATE TABLE 2
CREATE TABLE teacher.learner
(
	learner_id SERIAL PRIMARY KEY,
	learner_name VARCHAR NOT NULL,
	course_id INT,
	FOREIGN KEY (course_id) REFERENCES teacher.course(course_id)   -- FK constraint
);

--- VALUE INSERT
INSERT INTO teacher.learner (learner_name, course_id)
VALUES
('Sakib Sheikh', 1),
('Iqbal Sharif', 3),
('Abir Hasan', 1),
('Rahi Karim', 2),
('Tanmoy Khan', 1),
('Usha Khan', 2),
('Jahid Hasan', 2),
('Kajal Molla', 4),
('Sifath Kazi', 3),
('Emon Molla', 4);

SELECT * FROM teacher.learner;


--- --- ONE TO MANY (1 : MANY) (Table A, 1 Row & Table B, Many Row Connection)

SELECT * FROM teacher.course;

SELECT * FROM teacher.learner WHERE course_id = 3;  

-- course_id 1 = Data Science 
-- course_id 2 = Deep Learning 
-- course_id 3 = English
-- course_id 4 = EEE





--- --- MANY TO MANY (MANY : MANY) (Table A, Many Row & Table B, Many Row Connection) 

--- TABLE C
CREATE TABLE teacher.learner_course
(
	learner_id INT,
	course_id INT
);

--- VALUE INSERT
INSERT INTO teacher.learner_course (learner_id, course_id)
VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(2, 1),
(2, 2),
(2, 3),
(2, 4),
(3, 1),
(3, 2),
(3, 3),
(3, 4),
(4, 1),
(4, 2),
(4, 3),
(4, 4);

SELECT * FROM teacher.learner_course WHERE learner_id = 1;

SELECT * FROM teacher.learner_course WHERE course_id = 4;





--- --- --- JOIN 
--- --- JOIN 4 TYPES (INNER JOIN, LEFT JOIN, RIGHT JOIN, FULL JOIN) & EXTRA (SELF JOIN) 

--- CREATE TABLE A
CREATE TABLE teacher.customer
(
	customer_id SERIAL PRIMARY KEY,
	first_name VARCHAR,
	last_name VARCHAR,
	address_id INT
);

--- VALUE INSERT
INSERT INTO teacher.customer (first_name, last_name, address_id)
VALUES
('Mary', 'Smith', 5),
('Linda', 'Williams', 7),
('Barbara', 'Jones', 8),
('Madan', 'Mohan', 6);
SELECT * FROM teacher.customer;

--- CREATE TABLE B
CREATE TABLE teacher.payment
(
	customer_id SERIAL PRIMARY KEY,
	amount DECIMAL,
	mode VARCHAR,
	payment_date DATE
);

--- VALUE INSERT
INSERT INTO teacher.payment (amount, mode, payment_date)
VALUES
(60, 'Cash', '2020-09-24'),
(30, 'Credit Card', '2020-04-27'),
(110, 'Cash', '2021-01-26'),
(70, 'Mobil Payment', '2021-02-28'),
(80, 'Cash', '2021-03-01'),
(20, 'Mobile Payment', '2021-02-01'),
(250, 'Credit Card', '2021-04-01'),
(90, 'Mobile Payment', '2021-02-28');
SELECT * FROM teacher.payment;


--- --- JOIN
SELECT * 
FROM teacher.customer AS c 
JOIN teacher.payment AS p 
ON c.customer_id = p.customer_id;

-- Type cast: 
-- AND c.first_name = p.mode :: TEXT);
-- AND c.first_name = p.mode :: CHARACTER VARYING / VARCHAR);
-- AND c.first_name = CAST(p.mode AS CHARACTER / VARCHAR);


--- EQUAL JOIN (=)
-- ON/AND c.customer_id = p.customer_id

--- THETA JOIN (>, <, <=, >=, <>, !=)
-- ON/AND c.customer_id > p.customer_id; 



--- --- INNER JOIN 
SELECT * FROM teacher.customer AS c 
INNER JOIN teacher.payment AS p 
ON c.customer_id = p.customer_id;


SELECT c.first_name, p.amount, p.mode 
FROM teacher.customer AS c 
INNER JOIN teacher.payment AS p 
ON c.customer_id = p.customer_id;



--- --- LEFT JOIN & LEFT OUTER JOIN (SAME)
SELECT * FROM teacher.customer AS c 
LEFT JOIN teacher.payment AS p 
ON c.customer_id = p.customer_id;


SELECT c.first_name, p.amount, p.mode 
FROM teacher.customer AS c 
LEFT JOIN teacher.payment AS p 
ON c.customer_id = p.customer_id;



--- --- RIGHT JOIN & RIGHT OUTER JOIN (SAME) 
SELECT * FROM teacher.customer AS c 
RIGHT JOIN teacher.payment AS p 
ON c.customer_id = p.customer_id;


SELECT c.first_name, p.amount, p.mode 
FROM teacher.customer AS c 
RIGHT JOIN teacher.payment AS p 
ON c.customer_id = p.customer_id;



--- --- FULL JOIN / FULL OUTER JOIN (SAME)
SELECT * FROM teacher.customer AS c 
FULL OUTER JOIN teacher.payment AS p 
ON c.customer_id = p.customer_id;


SELECT c.first_name, p.amount, p.mode 
FROM teacher.customer AS c 
FULL OUTER JOIN teacher.payment AS p 
ON c.customer_id = p.customer_id;



--- --- CROSS JOIN / a = 1, 2 & B = 3, 4 	--> (A*B) = (1, 3)(1, 4)(2, 3)(2, 4)
SELECT *
FROM teacher.customer AS c 
CROSS JOIN teacher.payment AS p 




--- --- SELF JOIN (SAME TABLE LIKE THAT, TABLE A)
--- CREATE TABLE 
CREATE TABLE teacher.employee
(
	employee_id SERIAL PRIMARY KEY,
	employee_name VARCHAR,
	manager_id INT
);

--- VALUE INSERT
INSERT INTO teacher.employee (employee_name, manager_id)
VALUES
('Usha Khan', 3),
('Samiya Khan', 4),
('Rafi Khan', 2),
('Nizum Khan', 3);

SELECT * FROM teacher.employee;



--- SELF JOIN 	-- (LEFT, RIGHT, FULL, CROSS) - (ARE USED IN SALEF JOIN))
SELECT * FROM teacher.employee AS emp1	-- emp1 = TABLE1	-- emp2 = TABLE2 
JOIN teacher.employee AS emp2
ON emp2.employee_id = emp1.manager_id;


SELECT T1.employee_name, T2.employee_name AS manager_name
FROM teacher.employee AS T1
JOIN teacher.employee AS T2
ON T2.employee_id = T1.manager_id;


SELECT emp1.employee_name AS emp_name, emp2. employee_name AS manager_name
FROM teacher.employee AS emp1 
JOIN teacher.employee AS emp2
ON emp2.employee_id = emp1.manager_id;





--- --- --- UNION & UNION ALL
--- CREATE TABLE 1
CREATE TABLE teacher.customerA
(
	customer_name VARCHAR,
	customer_amount INT
);

--- VALUE INSERT
INSERT INTO teacher.customerA (customer_name, customer_amount)
VALUES
('Madan Mohan', 2100),
('Gopi Nath', 1200),
('Govinda Dev', 5000);
SELECT * FROM teacher.customerA;

--- CREATE TABLE 2
CREATE TABLE teacher.customerB
(
	customer_name VARCHAR,
	customer_amount INT
);

--- VALUE INSERT
INSERT INTO teacher.customerB (customer_name, customer_amount)
VALUES
('Gopal Bhat', 1500),
('Madan Mohan', 2100);
SELECT * FROM teacher.customerB;


--- --- UNION
SELECT customer_name, customer_amount
FROM teacher.customerA
UNION
SELECT customer_name, customer_amount
FROM teacher.customerB;


--- UNION ALL 
SELECT customer_name, customer_amount
FROM teacher.customerA
UNION ALL
SELECT customer_name, customer_amount
FROM teacher.customerB;




--- --- --- SUB QUERY 
--- --- 
SELECT * FROM teacher.payment;

-- Find the average value
SELECT AVG(amount) FROM teacher.payment;

SELECT * FROM teacher.payment
WHERE amount > 70

-- Dynamic Way
SELECT * FROM teacher.payment
WHERE amount > (SELECT AVG(amount) FROM teacher.payment);




SELECT * FROM teacher.customer;

SELECT customer_id FROM teacher.payment;


SELECT customer_id, amount, mode
FROM teacher.payment
WHERE customer_id IN (SELECT customer_id FROM teacher.customer);


-- SUB Query using logical (Exists) Operator 
SELECT first_name, last_name
FROM teacher.customer AS c
WHERE EXISTS (SELECT customer_id, amount 
				FROM teacher.payment AS p
				WHERE p.customer_id = c.customer_id
				AND amount > 70)





--- SUB QUERY 3 TYPES (NORMAL SUB-QUERY, CORRELATED SUB-QUERY, CTE SUB-QUERY)
-- 1. NORMAL SUB-QUERY: 
-- 2. CORRELATED SUB-QUERY: WHEN JOINING the MAIN QUERY from within a SUB-QUERY
-- 3. CTE SUB-QUERY: IT'S TEMPORARY TABLE, INSIDE YOUR QUERY 
WITH my_cte AS 
( 
	SELECT *, 
	AVG(amount) OVER(ORDER BY p.customer_id) AS "Average Price",
	COUNT(address_id) OVER(ORDER BY c.customer_id) AS "Count"
	FROM teacher.payment AS p
	INNER JOIN teacher.customer AS c
	ON p.customer_id = c.customer_id
)
SELECT first_name, last_name
FROM my_cte;









--- --- --- WINDOWS FUNCTION (AGGREGATE, RANKING, ANALYTIC)

--- CREATE TABLE
CREATE TABLE teacher.test_data
(
	new_id INT,
	new_cat VARCHAR
);

INSERT INTO teacher.test_data (new_id, new_cat)
VALUES
(100, 'Agni'), (200, 'Agni'),(200, 'Vayu'), (300, 'Vayu'), (500, 'Vayu'), (500, 'Dharti'), (700, 'Dharti');

SELECT * FROM teacher.test_data;


--- --- AGGREGATE FUNCTION

SELECT new_id, new_cat,
SUM(new_id) OVER(PARTITION BY new_cat ORDER BY new_id) AS "Total Sum",
AVG(new_id) OVER(PARTITION BY new_cat ORDER BY new_id) AS "Average",
COUNT(new_id) OVER(PARTITION BY new_cat ORDER BY new_id) AS "Count",
MIN(new_id) OVER(PARTITION BY new_cat ORDER BY new_id) AS "Minimum",
MAX(new_id) OVER(PARTITION BY new_cat ORDER BY new_id) AS "Maximum"
FROM teacher.test_data;

--- 
SELECT new_id, new_cat,
SUM(new_id) OVER(ORDER BY new_id ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS "Total Sum",
AVG(new_id) OVER(ORDER BY new_id ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS "Average",
COUNT(new_id) OVER(ORDER BY new_id ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS "Count",
MIN(new_id) OVER(ORDER BY new_id ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS "Minimum",
MAX(new_id) OVER(ORDER BY new_id ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS "Maximum"
FROM teacher.test_data;


--- --- RANKING FUNCTION
SELECT new_id, 
ROW_NUMBER() OVER(ORDER BY new_id) AS "ROW_NUMBER",
RANK() OVER(ORDER BY new_id) AS "RANK",
DENSE_RANK() OVER(ORDER BY new_id) AS "DENSE_RANK",
PERCENT_RANK() OVER(ORDER BY new_id) AS"PERCENT_RANK"
FROM teacher.test_data;


--- --- ANALYTIC FUNCTION
SELECT new_id, 
FIRST_VALUE(new_id) OVER(ORDER BY new_id) AS "FIRST_VALUE",
LAST_VALUE(new_id) OVER(ORDER BY new_id) AS "LAST_VALUE",
LEAD(new_id) OVER(ORDER BY new_id) AS "LEAD",
LAG(new_id) OVER(ORDER BY new_id) AS "LAG"
FROM teacher.test_data;


-- Assignment: WINDOW FUNCTION (Offset the LEAD and LAG values by 2 in the output columns?)
-- Answer: 
SELECT new_id, 
LEAD(new_id, 2) OVER(ORDER BY new_id) AS "LEAD_2",
LAG(new_id, 2) OVER(order BY new_id) AS "LAG_2"
FROM teacher.test_data;






--- --- --- CASE Statement 
--- --- CREATE TABLE 
SELECT * FROM teacher.payment;

SELECT customer_id, amount, 
CASE
	WHEN amount > 70 THEN 'Expensive Product'
	WHEN amount = 70 THEN 'Moderate Product'
	ELSE 'Inexpensive Product'
END AS ProductStatus
FROM teacher.payment;
	


--- --- CASE EXPRESSION 
SELECT * FROM teacher.payment;

SELECT customer_id, 
CASE amount
	WHEN 70 THEN 'Prime Customer'
	WHEN 110 THEN 'Plus Customer'
	ELSE 'Regular Customer'
END AS CustomerStatus
FROM teacher.payment;





--- --- --- --- CTE (Means that the Temporary Table) 
SELECT * FROM teacher.payment;
SELECT * FROM teacher.customer;


--- (my_cte means that the Temporary Table)
WITH my_cte AS ( 
	SELECT *, 
	AVG(amount) OVER(ORDER BY p.customer_id) AS "Average Price",
	COUNT(address_id) OVER(ORDER BY c.customer_id) AS "Count"
	FROM teacher.payment AS p
	INNER JOIN teacher.customer AS c
	ON p.customer_id = c.customer_id
)
SELECT first_name, last_name
FROM my_cte;


--- 
WITH my_cte AS ( 
	SELECT *, 
	AVG(amount) OVER(ORDER BY p.customer_id) AS "Average Price",
	COUNT(address_id) OVER(ORDER BY c.customer_id) AS "Count"
	FROM teacher.payment AS p
	INNER JOIN teacher.customer AS c
	ON p.customer_id = c.customer_id
)
SELECT first_name, last_name, amount
FROM my_cte;



--- 
SELECT * FROM teacher.payment;

--- Exercise
with my_cte AS (
	SELECT mode, MAX(amount) AS hight_price, SUM(amount) AS total_price
	FROM teacher.payment
	GROUP BY mode 
)
SELECT teacher.payment.*, my.hight_price, my.total_price
FROM teacher.payment
JOIN my_cte AS my
ON teacher.payment.mode = my.mode
ORDER BY teacher.payment.mode;





--- --- END --- ---
--- --- --- --- --- 








--- --- --- ARRAY & JSON 
--- --- ARRAY: 
CREATE TABLE teacher.students_2
(
	student_id SERIAL,
	student_name VARCHAR,
	subject_name VARCHAR,
	numbers INT[] -- ARRAY TYPE
);

--- VALUE INSERT
INSERT INTO teacher.students_2 (student_name, subject_name, numbers)
VALUES
('Akash', 'Bangla', '{90, 85, 71}'),
('Usha', 'Bangla', '{87, 68, 92}'),
('Nizum', 'Math', '{87, 76, 91}'), 
('Rodoshi', 'Math', '{87, NULL, 92}'),
('Achol', 'English', '{87, NULL, 91}'); 

SELECT * FROM teacher.students_2 AS stu2;
SELECT * FROM teacher.students_2 stu2;



SELECT 
stu2.subject_name,
stu2.subject_name,
stu2.numbers[1]
FROM
teacher.students_2 stu2


SELECT 
stu2.subject_name,
stu2.subject_name,
stu2.numbers
FROM
teacher.students_2 stu2


UPDATE teacher.students_2
SET numbers = '{87, 76, 93}'
WHERE student_name = 'Nizum';

SELECT * FROM teacher.students_2 stu2;



UPDATE teacher.students_2
SET numbers [2]= 80
WHERE student_name = 'Nizum';


UPDATE teacher.students_2
SET numbers [2]= 79
WHERE student_name = 'Nizum';

UPDATE teacher.students_2
SET numbers [2]= 80 
WHERE numbers[2] = 79;

SELECT * FROM teacher.students_2 stu2;


--- DELETE (Need to Update and then Delete) 

-- DELETE FROM teacher.students_2
-- WHERE ....


UPDATE teacher.students_2
SET numbers [2]= NULL 
WHERE student_name = 'Nizum';

SELECT * FROM teacher.students_2



--- WHEN MULTIPLE TABLE IN (ARRAY)
CREATE TABLE teacher.section
(
	id SERIAL,
	section_name VARCHAR,
	enrolled_students INT[]
);

--- VALUE INSERT
INSERT INTO teacher.section (section_name ,enrolled_students)
VALUES
('sec a', '{1,2}'),
('sec b', '{3,4}');

SELECT * FROM teacher.section;


--- 2 TABLE JOIN (students_2 & section)
SELECT 
stu.student_name, sec.section_name
FROM teacher.students_2 stu
JOIN teacher.section sec
ON ARRAY [stu.student_id] <@ sec.enrolled_students;
-- The one I'm checking is on the left side, and the one I'm checking with is on the right side.

SELECT 
stu.student_name, sec.section_name, stu.teacher
FROM teacher.students_2 stu
JOIN teacher.section sec
ON stu.teacher && sec.teacher;





--- --- JSON: (PLAIN TEXT) (SLOW FOR SELECTION) (WHITESPACE & ORDER)

--- --- JSONB: (BINARY FORMATE) (SLOW FOR INSERT / UPDATE) (WHITESPACE & ORDER IS NOT STROED) SO, WE USE JSONB 

-- name, age, skills (collum) 	-- key & value
'{
"name": "Mr A",
"age": 32,
"skills":["SQL", "PYTHON", "BLABLAbla"]
}'

CREATE TABLE teacher. profile
(
	id SERIAL,
	user_data JSONB
);

--- VALUE INSERT
INSERT INTO teacher.profile (user_data)
VALUES
('{
"name": "Mr A",
"age": 32,
"skills":["SQL", "PYTHON", "BLABLAbla"]
}'
),
('{
"name": "Mr B",
"age": 33,
"skills":["bl;abla", "PYTHON", "BLABLAbla"]
}'
),
('{
"full_name": "Mr C",
"age": 33,
"skill":["bangla", "PYTHON", "BLABLAbla"]
}'
);

SELECT * FROM teacher.profile;


--- 
SELECT 
up.user_data -> 'name',
up.user_data -> 'full_name'
FROM teacher.profile AS up;


SELECT 
up.user_data ->> 'name',
up.user_data ->> 'full_name'
FROM teacher.profile AS up;


--- 
SELECT 
CASE
	WHEN up.user_data ->> 'name' IS NOT NULL THEN up.user_data ->> 'name'
	ELSE up.user_data ->> 'full_name'
END AS "name"
FROM teacher.profile AS up;




--- 
SELECT 
up.user_data ->> 'name' AS "name"
FROM teacher.profile AS up
WHERE up.user_data ->> 'name' IS NOT NULL

UNION ALL 	--- Doing Marge

SELECT 
up.user_data ->> 'full_name' as" name"
FROM teacher.profile AS up
WHERE up.user_data ->> 'full_name' IS NOT NULL;



--- 
SELECT 
up.user_data ->> 'full_name' as" name"
FROM teacher.profile AS up
WHERE up.user_data? 'full_name';


SELECT 
up.user_data ->> 'full_name' as" name"
FROM teacher.profile AS up
WHERE up.user_data? 'name';



--- 
SELECT 
up.user_data ->> 'name' as" name",
up.user_data -> 'skills' ->> 1,
up.user_data ->> 'skill'
FROM teacher.profile AS up;

SELECT 
up.user_data ->> 'name' as" name",
up.user_data -> 'skills' ->> 3,
up.user_data ->> 'skill'
FROM teacher.profile AS up;








--- --- --- --- --- Analytical Part (TRANSFORMATION and Custom Data Types )

--- ### TRANSFORMATION ### --- 

--- --- PIVOTING --- ---
--- --- CREATE TABLE
CREATE TABLE teacher.sales
(
	id SERIAL,
	year INT,
	amount INT,
	quarter INT
);

--- VALUE INSERT
INSERT INTO teacher.sales (year, quarter, amount)
VALUES
(2023, 1, 300),
(2023, 2, 600),
(2023, 3, 400),
(2022, 3, 500);

SELECT * FROM teacher.sales AS sl;
SELECT sl.* FROM teacher.sales AS sl;



--- --- I Broke the VALUE and put it in the COLUMN 
YEAR	|	Qaureter1	|	Qaureter2	|	Qaureter3
-------------------------------------------------------
2023 	|		300 	|		600		|		400 	
2022 	|				|				|		500		


--- --- Tablefunc
SELECT year, quarter, amount FROM teacher.sales ORDER BY year, quarter;

SELECT year, quarter, amount FROM teacher.sales ORDER BY 1, 2;

SELECT quarter FROM teacher.sales;
SELECT DISTINCT quarter FROM teacher.sales;
SELECT DISTINCT quarter FROM teacher.sales ORDER BY 1;


--- CROSSTAB (FUNCTION / EXTENTION) 
CROSSTAB(
$$SELECT year, quarter, amount FROM teacher.sales ORDER BY 1, 2$$,
$$SELECT DISTINCT quarter FROM teacher.sales ORDER BY 1$$
)


--- OR, --- 
CREATE EXTENSION IF NOT EXISTS tablefunc;		-- tablefunc (EXTENSION)

SELECT * FROM
CROSSTAB(
'SELECT year, quarter, amount FROM teacher.sales ORDER BY 1, 2',
'SELECT DISTINCT quarter FROM teacher.sales ORDER BY 1'
) AS cte 
(
year INT, Qaureter1 INT, Qaureter2 INT, Qaureter3 INT
) ORDER BY year DESC;





--- OR, 
SELECT
	year,
	quarter AS Qaureter1,
	quarter AS Qaureter2,
	quarter AS Qaureter3,	
	amount
FROM
	teacher.sales;


--- OR, 
SELECT
	year,
	CASE WHEN quarter=1 THEN amount END Qaureter1,
	CASE WHEN quarter=2 THEN amount END Qaureter2,
	CASE WHEN quarter=3 THEN amount END Qaureter3,
	amount
FROM
	teacher.sales;


--- OR, 
SELECT
	year,
--	quarter AS Qaureter1,
	CASE WHEN quarter=1 THEN amount END AS Qaureter1,
--	quarter AS Qaureter2,
	CASE WHEN quarter=2 THEN amount END AS Qaureter2,
--	quarter AS Qaureter3,
	CASE WHEN quarter=3 THEN amount END AS Qaureter3,
	amount
FROM
	teacher.sales;


--- 
SELECT
	year,
--	quarter AS Qaureter1,
	CASE WHEN quarter=1 THEN amount END AS Qaureter1,
--	quarter AS Qaureter2,
	CASE WHEN quarter=2 THEN amount END AS Qaureter2,
--	quarter AS Qaureter3,
	CASE WHEN quarter=3 THEN amount END AS Qaureter3
FROM
	teacher.sales; 



--- OR, --- 
SELECT
	year,
	SUM(CASE WHEN quarter=1 THEN amount END) AS Qaureter1,
	SUM(CASE WHEN quarter=2 THEN amount END) AS Qaureter2,
	SUM(CASE WHEN quarter=3 THEN amount END) AS Qaureter3
FROM
	teacher.sales
GROUP BY year
ORDER BY year DESC;

 

--- CREATE TABLE: 
SELECT
	year,
	SUM(CASE WHEN quarter=1 THEN amount END) AS Qaureter1,
	SUM(CASE WHEN quarter=2 THEN amount END) AS Qaureter2,
	SUM(CASE WHEN quarter=3 THEN amount END) AS Qaureter3
	INTO teacher.sales_pivoted
FROM
	teacher.sales
GROUP BY year
ORDER BY year DESC;


SELECT * FROM teacher.sales_pivoted;








--- --- UNPIVOTING --- ---
SELECT * FROM teacher.sales_pivoted;


--- --- I broke the COLUMN and put it in the VALUE 

YEAR	|		AMOUNT 		| 		QUARTER 	
---------------------------------------------------
2023 	|		------		|		1			
2023 	|		------		|		2			
2023 	|		------		|		3			
2023 	|		------		|		3			



--- --- 
SELECT * FROM teacher.sales_pivoted;

SELECT * FROM teacher.sales;



SELECT
	sp."year",
	NULL AS amount,
	sp.qaureter1,
	sp.qaureter2,
	sp.qaureter3
FROM teacher.sales_pivoted AS sp;



--- ---
SELECT
	sp."year",
	sp.qaureter1 AS amount,
	1 AS qaureter
FROM teacher.sales_pivoted AS sp
WHERE sp.qaureter1 IS NOT NULL
UNION ALL
SELECT
	sp."year",
	sp.qaureter2 AS amount,
	2 AS qaureter
FROM teacher.sales_pivoted AS sp
WHERE sp.qaureter2 IS NOT NULL
UNION ALL
SELECT
	sp."year",
	sp.qaureter3 AS amount,
	3 AS qaureter
FROM teacher.sales_pivoted AS sp
WHERE sp.qaureter3 IS NOT NULL;








--- --- ### CUSTOM DATA TYPE 
--- --- COMPOSITIE TYPE 
--- --- ### 
--- CREATE TABLE 
CREATE TABLE teacher.dept
(
id SERIAL,
dept_info JSON 	-- (dept name, manager id, dept desc)
);


--- VARCHAR, TEXT, INT, FLOAT, JSON, ..... ..... .....
CREATE TYPE dept_info_type AS
(
	dept_name VARCHAR,
	mgr_id INT,
	dept_desc TEXT
);


CREATE TABLE teacher.dept
(
	id SERIAL,
	dept_info dept_info_type,	-- (dept name, manager id, dept desc)
	location INT
);

--- VALUE INSERT
INSERT INTO teacher.dept (dept_info, location)
VALUES
(('English', 765, 'This dept was created for bla bla bla'), 76547),
(('Bangla', 76576, 'This dept was created for bla bla bla'), 79599),
(('Math', 43324, 'This dept was created for bla bla bla'), 543);

SELECT * FROM teacher.dept;




--- --- ### --- --- 
--- --- ENUMERATED (ENUM)
--- CREATE TABLE

CREATE TYPE emotion_type AS ENUM('happy', 'sad', 'nutral');

CREATE TABLE teacher.emotions
(
	id SERIAL,
	emotion VARCHAR, 	-- happy, sad, nutral
	human_name VARCHAR
);

--- VALUE INSERT
INSERT INTO teacher.emotions (emotion, human_name)
VALUES
('happy', 'Mr X'),
('sad', 'Mr Y'),
('nutral', 'Ms Z'),
('happy', 'Ms A');

SELECT * FROM teacher.emotions;



--- --- --- ---
--- --- CREATE TABLE
CREATE TABLE teacher.call_history
(
	chid SERIAL,
	start_time TIMESTAMP,
	end_time TIMESTAMP,
	_user INT,
	created_at TIMESTAMP
);

DROP TABLE teacher.call_history


--- --- ### RANGE TYPE
CREATE TYPE callduration AS RANGE(subtype = time);

CREATE TABLE teacher.call_history
(
	chid SERIAL,
	duration callduration,
	_user INT,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

--- VALUE INSERT
INSERT INTO teacher.call_history(duration, _user)
VALUES
('[10:20, 10:28)', 76576),
('[09:34, 09:36)', 76576);


SELECT * FROM teacher.call_history
WHERE duration @> '10:25'::time;

-- WHERE start_time >= 8987 AND end_time <= 85763

SELECT * FROM teacher.call_history
WHERE duration && '[09:35, 09:36)'::callduration;





--- --- ### --- --- 
--- --- Question & Answer Type 
CREATE TYPE teacher.qatype AS (q VARCHAR, a VARCHAR);

CREATE TABLE teacher.auto_generated_qa
(
	qaid SERIAL,
	-- question teacher.qatype PRIMARY KEY,
	-- answer teacher.qatype,
	qa teacher.qatype,
	is_deleted BOOL DEFAULT FALSE, 	-- FALSE/TRUE
	qa_added_by INT,
	created_at TIMESTAMP DEFAULT NOW(),
	update_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

--- VALUE INSERT
INSERT INTO teacher.auto_generated_qa (qa, qa_added_by)
VALUES
(('What''s your cat name?', 'Sequel'), 67456),
(('How old is your dog', '10 years'), 6546);

SELECT * FROM teacher.auto_generated_qa


SELECT 
(qa).a 
FROM teacher.auto_generated_qa
WHERE (qa).q = 'How old is your dog';


--- --- --- --- --- --- 	--- --- --- --- --- --- 
--- --- --- --- --- --- 	--- --- --- --- --- --- 



