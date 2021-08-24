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