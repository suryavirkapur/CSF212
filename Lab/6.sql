-- 1. Retrieve salesman name and customer name
SELECT s.name AS "SALESMAN", c.cust_name AS "CUSTOMER"
FROM SALESMAN s
JOIN CUSTOMER c ON s.salesman_id = c.salesman_id;

-- 2. Retrieve customer name, salesman name, and salesman commission where commission is greater than 12%
SELECT c.cust_name, s.name, s.commission
FROM CUSTOMER c
JOIN SALESMAN s ON c.salesman_id = s.salesman_id
WHERE s.commission > 0.12;

-- 3. Retrieve customer name, salesman name, customer city, salesman city, and commission where customer city and salesman city differ and commission is greater than 12%
SELECT c.cust_name, s.name, c.city, s.city, s.commission
FROM CUSTOMER c
JOIN SALESMAN s ON c.salesman_id = s.salesman_id
WHERE c.city <> s.city AND s.commission > 0.12;

-- 4. Retrieve salesman name, customer name, order number, order date, and purchase amount
SELECT s.name, c.cust_name, o.ord_no, o.ord_date, o.purch_amt
FROM SALESMAN s
JOIN CUSTOMER c ON s.salesman_id = c.salesman_id
JOIN ORDERS o ON c.customer_id = o.customer_id;

-- 5. Retrieve all customer names, both with and without a salesman, ordered by name
SELECT cust_name
FROM CUSTOMER
WHERE salesman_id IS NOT NULL
UNION
SELECT cust_name
FROM CUSTOMER
WHERE salesman_id IS NULL
ORDER BY cust_name;

-- 6. Retrieve all combinations of salesman and customer names
SELECT s.name, c.cust_name
FROM SALESMAN s
CROSS JOIN CUSTOMER c;

-- 7. Create a view of salesman ID, name, and city
CREATE VIEW SALESPERSON_VIEW AS
SELECT salesman_id, name, city
FROM SALESMAN;

-- 8. Create a view of New York salespeople with ID, name, city, commission
CREATE VIEW NY_SALESPEOPLE AS
SELECT salesman_id, name, city, commission
FROM SALESMAN
WHERE city = 'New York';

-- 9. Create a view that counts the number of customers in each grade
CREATE VIEW CUST_GRADE_COUNT AS
SELECT grade, COUNT(*) AS number
FROM CUSTOMER
GROUP BY grade;

-- 10. Create a view that summarizes orders by date with count, average, and sum
CREATE VIEW CUST_ORDER_SUMMARY AS
SELECT ord_date, COUNT(DISTINCT customer_id) AS count,
      AVG(purch_amt) AS avg, SUM(purch_amt) AS `sum`
FROM ORDERS
GROUP BY ord_date
ORDER BY ord_date;

-- Create COURSE table
CREATE TABLE COURSE (
    course_id VARCHAR(10) PRIMARY KEY,
    title VARCHAR(100),
    dept_name VARCHAR(50),
    credits INT
);

-- Insert data into COURSE table
INSERT INTO COURSE VALUES
    ('BIO-301', 'Genetics', 'Biology', 4),
    ('CS-190', 'Game Design', 'Comp. Sci.', 4),
    ('CS-315', 'Robotics', 'Comp. Sci.', 3);

-- Create PREREQ table
CREATE TABLE PREREQ (
    course_id VARCHAR(10),
    prereq_id VARCHAR(10),
    prereq_title VARCHAR(100),
    FOREIGN KEY (course_id) REFERENCES COURSE(course_id)
);

-- Insert data into PREREQ table
INSERT INTO PREREQ VALUES
    ('CS-190', 'CS-101', 'CS-101'),
    ('CS-315', 'CS-101', 'CS-101'),
    ('BIO-301', 'BIO-101', 'Biology');

-- 11. Left outer join COURSE and PREREQ
SELECT c.course_id, c.title, p.prereq_id, p.prereq_title
FROM COURSE c
LEFT OUTER JOIN PREREQ p ON c.course_id = p.course_id;

-- 12. Right outer join COURSE and PREREQ
SELECT c.course_id, c.title, p.prereq_id, p.prereq_title
FROM COURSE c
RIGHT OUTER JOIN PREREQ p ON c.course_id = p.course_id;

-- 13. Full outer join COURSE and PREREQ
SELECT c.course_id, c.title, p.prereq_id, p.prereq_title
FROM COURSE c
LEFT JOIN PREREQ p ON c.course_id = p.course_id
UNION
SELECT c.course_id, c.title, p.prereq_id, p.prereq_title
FROM COURSE c
RIGHT JOIN PREREQ p ON c.course_id = p.course_id
WHERE c.course_id IS NULL;