-- Salesmen with all information who live in the city where any of the customers live:
SELECT *
FROM SALESMAN
WHERE city IN (SELECT city FROM CUSTOMER);

-- Orders with amounts greater than at least one of the orders on September 10th, 2012:
SELECT *
FROM ORDERS
WHERE purch_amt > (SELECT MIN(purch_amt) FROM ORDERS WHERE ord_date = '2012-09-10');

-- Orders with an amount smaller than any amount for a customer in London
SELECT *
FROM ORDERS
WHERE purch_amt <
      (SELECT MIN(purch_amt) FROM ORDERS WHERE customer_id IN (SELECT customer_id FROM CUSTOMER WHERE city = 'London'));

-- Customers whose grade is higher than every customer in New York:
SELECT *
FROM CUSTOMER
WHERE grade > (SELECT MAX(grade) FROM CUSTOMER WHERE city = 'New York');

-- Customers whose grade is not the same as the grade of any customer in London:
SELECT *
FROM CUSTOMER
WHERE grade NOT IN (SELECT grade FROM CUSTOMER WHERE city = 'London');

-- Orders issued by the salesman 'Paul Adam':
SELECT *
FROM ORDERS
WHERE salesman_id = (SELECT salesman_id FROM SALESMAN WHERE name = 'Paul Adam');

-- Orders for the salesman who belongs to the city London:
SELECT *
FROM ORDERS
WHERE salesman_id IN (SELECT salesman_id FROM SALESMAN WHERE city = 'London');

-- Orders with values greater than the average order value for 10th October 2012:
SELECT *
FROM ORDERS
WHERE purch_amt > (SELECT AVG(purch_amt) FROM ORDERS WHERE ord_date = '2012-10-10');

-- Commission of all the salesmen servicing customers in Paris:
SELECT commission
FROM SALESMAN
WHERE salesman_id IN (SELECT salesman_id FROM CUSTOMER WHERE city = 'Paris');

-- Customers with orders on October 5, 2012:
SELECT *
FROM CUSTOMER
WHERE customer_id IN (SELECT customer_id FROM ORDERS WHERE ord_date = '2012-10-05');
