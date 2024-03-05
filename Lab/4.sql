-- Create the `suppliers` table
CREATE TABLE suppliers
(
    sno   INT(1) PRIMARY KEY,
    sname VARCHAR(225),
    city  VARCHAR(225)
);

-- Create the `part` table
CREATE TABLE part
(
    pno   INT PRIMARY KEY,
    pname VARCHAR(100),
    price INT
);

-- Create the `sells` table
CREATE TABLE sells
(
    sno INT,
    pno INT,
    FOREIGN KEY (sno) REFERENCES suppliers (sno) ON DELETE SET NULL,
    FOREIGN KEY (pno) REFERENCES part (pno) ON DELETE SET NULL
);

-- Insert data into the `suppliers` table
INSERT INTO suppliers
VALUES (1, 'Smith', 'London'),
       (2, 'Jonas', 'Paris'),
       (3, 'Adams', 'Vienna'),
       (4, 'blake', 'Rome');

-- Insert data into the `part` table
INSERT INTO part
VALUES (1, 'screw', 10),
       (2, 'nut', 8),
       (3, 'bolt', 15),
       (4, 'cam', 25);


-- Insert data into the `sells` table
INSERT INTO sells
VALUES (1, 1),
       (1, 2),
       (2, 4),
       (3, 1),
       (3, 3),
       (4, 2),
       (4, 3),
       (4, 4);

-- Query the `part` table
SELECT *
FROM part
WHERE price > 10;

SELECT pno, pname
FROM part
WHERE price > 10;

SELECT pname, price
FROM part
WHERE pname = 'bolt'
  AND (price = 0 OR price <= 15);

SELECT pname, price * 2 AS duble
FROM part
WHERE price * 2 < 50;

-- Join tables
SELECT s.sname, p.pname
FROM suppliers s
         JOIN part p
         JOIN sells se ON s.sno = se.sno AND p.pno = se.pno;

SELECT *
FROM suppliers s
         JOIN part p
         JOIN sells se ON s.sno = se.sno AND p.pno = se.pno;

-- Aggregate function
SELECT AVG(price) AS avg_price
FROM part;

-- Grouping and counting
SELECT s.sno, s.sname, COUNT(se.pno)
FROM suppliers s
         JOIN sells se ON s.sno = se.sno
GROUP BY s.sno;

SELECT s.sno, s.sname, COUNT(se.pno) as Count
FROM suppliers s
         JOIN sells se ON s.sno = se.sno
GROUP BY s.sno, s.sname
HAVING COUNT(se.pno) > 1;

-- Subqueries
SELECT *
FROM part
WHERE price > (SELECT price
               FROM part
               WHERE pname = 'Screw');

SELECT *
FROM suppliers s
WHERE NOT EXISTS (SELECT *
                  FROM sells se
                  WHERE se.sno = s.sno);

-- Union
SELECT s.sno, s.sname, s.city
FROM suppliers s
WHERE s.sname = 'Jonas'
UNION
SELECT s.sno, s.sname, s.city
FROM suppliers s
WHERE s.sname = 'Adams';

-- Distinct and multiple table references
SELECT DISTINCT s.sno, s.sname, s.city
FROM suppliers s
         JOIN suppliers t ON s.sno > 1 AND t.sno > 2;
