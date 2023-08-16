SHOW DATABASES;
USE test;

-- SQL (Basic) Skills Certification Test 

-- On the basis of merit, a company decides to promote some of its employee in its HR division at the end of the quarter 
-- because of their high performance. Write a query to find the employee IDs along with the names of all its employees 
-- who work in the HR department who earned a bonus of 5000 dollars or more in the last quarter.
-- There are two tables in the database: employee_information and last_quarter_bonus. Their primary keys are employee_ID.

CREATE TABLE employee_information (
	employee_ID INT,
    nam VARCHAR(255),
    division VARCHAR(255)
);

INSERT INTO employee_information
VALUES (1,'Julia', 'division'),
(2, 'Samantha', 'Tech'),
(3, 'Richard', 'HR');

SELECT * FROM employee_information;

CREATE TABLE last_quater_bonus (
	employee_ID INT,
    bonus VARCHAR(255)
);

INSERT INTO last_quater_bonus
VALUES (1,2000),
(2, 5500),
(3, 6240);

SELECT * FROM last_quater_bonus;
-- This is the query actually
SELECT employee_ID, nam
FROM employee_information
WHERE division = 'HR'
  AND employee_ID IN (
    SELECT employee_ID
    FROM last_quater_bonus
    WHERE bonus >= 5000
  );
  
-- Task 2
-- A school recently conducted its annual examination and wishes to know the list of academically low performing students to organize extra classes for them. Write a query to return the roll number and names of students who have a total of less than 100 marks including all 3 subjects.
-- There are two tables: student_information and examination_marks. Their primary keys are roll_number.

SELECT si.roll_number, si.name
FROM student_information si
JOIN examination_marks em
ON si.roll_number = em.roll_number
WHERE (em.subject_one + em.subject_two + em.subject_three) < 100;

-- Task 3
  CREATE TABLE customers (
	customer_id INT,
    nam VARCHAR(255),
    phone_number VARCHAR(255),
    country VARCHAR(255)
);

INSERT INTO customers
VALUES (1, 'Raghav', '951341341', 'India'),
(2, 'Jake', '52341351', 'USA'),
(3, 'Alice', '61341351', 'USA');

CREATE TABLE country_codes (
	country VARCHAR(255),
    country_code INT 
);

INSERT INTO country_codes
VALUES ('USA', 1),
('India', 91);

SELECT * FROM customers;
SELECT * FROM country_codes;

-- A company wants to contact each of its customers regarding the policy changes They have international customers, but their database does not include country codes with their phone numbers.
-- There are two tables in the database: customers and country_codes. The first table contains details of every customer including customer_id, name, phone_number, and country. The second table contains the country code for every country.
-- Write a query to retrieve a list of all customer ids, names, and phone numbers, with their country codes concatenated with their phone numbers. Sort the output in the order of their customer_id.
-- Note: The phone number should be in the following format: +COUNTRY_CODE PHONENUMBER (without spaces)

SELECT c.customer_id, c.nam, CONCAT('+', cc.country_code, ' ', c.phone_number) AS formatted_phone
FROM customers c
JOIN country_codes cc ON c.country = cc.country
ORDER BY c.customer_id;