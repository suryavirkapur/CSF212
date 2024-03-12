-- 1
SELECT *
FROM SALESMAN
WHERE city IN (SELECT city FROM CUSTOMER);

-- 2
SELECT *
FROM ORDERS
WHERE purch_amt > (SELECT MIN(purch_amt) FROM ORDERS WHERE ord_date = '2012-09-10');

-- 3
SELECT *
FROM ORDERS
WHERE purch_amt <
      (SELECT MIN(purch_amt) FROM ORDERS WHERE customer_id IN (SELECT customer_id FROM CUSTOMER WHERE city = 'London'));

-- 4
SELECT *
FROM CUSTOMER
WHERE grade > (SELECT MAX(grade) FROM CUSTOMER WHERE city = 'New York');

-- 5
SELECT *
FROM CUSTOMER
WHERE grade NOT IN (SELECT grade FROM CUSTOMER WHERE city = 'London');

-- 6
SELECT *
FROM ORDERS
WHERE salesman_id = (SELECT salesman_id FROM SALESMAN WHERE name = 'Paul Adam');

-- 7
SELECT *
FROM ORDERS
WHERE salesman_id IN (SELECT salesman_id FROM SALESMAN WHERE city = 'London');

-- 8
SELECT *
FROM ORDERS
WHERE purch_amt > (SELECT AVG(purch_amt) FROM ORDERS WHERE ord_date = '2012-10-10');

-- 9
SELECT name, commission
FROM SALESMAN
WHERE salesman_id IN (SELECT salesman_id FROM CUSTOMER WHERE city = 'Paris');

-- 10
SELECT *
FROM CUSTOMER
WHERE customer_id IN (SELECT customer_id FROM ORDERS WHERE ord_date = '2012-10-05');
