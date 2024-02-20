CREATE TABLE Admission
(
    No         INT PRIMARY KEY,
    Name       VARCHAR(255),
    Age        INT,
    Department VARCHAR(255),
    DateOfAdm  DATE,
    Fee        INT,
    Sex        CHAR(1)
);

INSERT INTO Admission
VALUES (1, 'Pankaj', 24, 'Computer', '2002-10-12', 120, 'M'),
       (2, 'Shalini', 21, 'History', '2012-02-25', 200, 'F'),
       (3, 'Sanjay', 22, 'HINDI', '2010-10-10', 300, 'F'),
       (4, 'Sudha', 25, 'History', '2015-05-30', 400, 'F'),
       (5, 'Rakesh', 22, 'Hindi', '2012-12-12', 250, 'M'),
       (6, 'Shakeel', 30, 'History', '2016-01-03', 300, 'M'),
       (7, 'Surya', 34, 'Computer', '2013-03-30', 210, 'M');

UPDATE Admission
SET Age = 27
WHERE Name = 'Pankaj';

UPDATE Admission
SET Fee = 425
WHERE No = 3;

ALTER TABLE Admission
    ADD City VARCHAR(15);

ALTER TABLE Admission
    DROP City;
