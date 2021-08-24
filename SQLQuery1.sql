USE Practice
CREATE TABLE Cities
(
Id int primary key identity,
[Name] nvarchar(75),
)

CREATE TABLE Salesmen
(
Id int primary key identity,
[Name] nvarchar(75),
[Commision] decimal(10,2),
[CityId] int FOREIGN KEY REFERENCES Cities(Id)
)

CREATE TABLE Customers
(
Id int primary key identity,
[Name] nvarchar(75),
[Grade] int,
[CityId] int FOREIGN KEY REFERENCES Cities(Id),
[SalesmanId] int FOREIGN KEY REFERENCES Salesmen(Id)
)

INSERT INTO Cities
VALUES('New York'),('London'),('Paris'),('San Jose'),('Rome'),('California'),('Berlin'),('Moscow')

SELECT * FROM Cities

INSERT INTO Salesmen
VALUES('James Hoog',0.15,1),
      ('Nail Knite',0.13,3),
      ('Pit Alex',0.11,2),
	  ('Mc Lyon',0.14,3),
	  ('Paul Adam',0.13,5),
	  ('Lauson Hen',0.122,4)

INSERT INTO Customers
VALUES('Nick Rimando',100,1,2),
      ('Brad Davis',200,1,2),
      ('Graham Zusi',200,6,3),
      ('Julian Green',300,2,3),
      ('Fabian Johnson',300,3,5),
      ('Geoff Cameron',100,7,7),
      ('Jozy Altidor',200,8,6),
      ('Brad Guzan',200,2,4)
     
SELECT ct.Name,c.Name [City] FROM Customers ct
JOIN Cities c
ON ct.CityId = c.Id
WHERE c.Name = 'London'
UNION All
SELECT s.Name,c.Name [City] FROM Salesmen s
JOIN Cities c
ON s.CityId = c.Id
WHERE c.Name = 'London'

SELECT ct.Name,c.Name [City] FROM Customers ct
JOIN Cities c
ON ct.CityId = c.Id 
WHERE c.Name = 'London'
UNION All
SELECT s.Name,c.Name [City] FROM Salesmen s
JOIN Cities c
ON s.CityId = c.Id 
WHERE c.Name = 'London'
Order By Name