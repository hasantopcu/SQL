create database salestransactions;
use salestransactions;
 
CREATE TABLE ProductInfo(
ProductID int NOT NULL PRIMARY KEY,
ProductName nvarchar(50) NULL,
ProductDescription nvarchar(100) NULL,
ProductCategoryName nvarchar(50) );


CREATE TABLE cities(
id int NOT NULL PRIMARY KEY,
name nvarchar(50)
);


CREATE TABLE CustomerInfo(
CustomerID int  NOT NULL PRIMARY KEY,
CustomerName nvarchar(50) NULL,
CustomerSurname nvarchar(50) NULL,
CustomerEmail nvarchar(100) NOT NULL,
CustomerPhone int NULL,
CustomerGeographyID int NULL ,
FOREIGN KEY(CustomerGeographyID) REFERENCES  cities(id) ON DELETE CASCADE ON UPDATE CASCADE);


CREATE TABLE SalespersonInfo(
SalespersonID int NOT NULL PRIMARY KEY,
SalespersonName nvarchar(50) NULL,
SalespersonSurname nvarchar(50) NULL,
StoreName nvarchar(50) NULL,
StoreID int not null,
StoreGeographyID int NULL,
FOREIGN KEY(StoreGeographyID) REFERENCES  cities(id) ON DELETE CASCADE ON UPDATE CASCADE );


CREATE TABLE DateInfo(
DateKey int NOT NULL PRIMARY KEY ,
CalendarYear int NOT NULL,
CalendarQuarter int NOT NULL,
MonthOfYear int NOT NULL,
MonthName nvarchar(15) NOT NULL,
MonthDay int NOT NULL,
DayOfWeek int NOT NULL,
DayName nvarchar(15) NOT NULL,
currentTime time not null
 );


CREATE TABLE FactSalesOrders(
ProductID int not null,
CustomerID int not null , 
SalesPersonID int not null , 
OrderDateID int not null,
OrderNo int NOT NULL,
ItemNo int NOT NULL,
Quantity int not NULL,
SalesAmount DECIMAL(15,2) NOT NULL,
Cost DECIMAL(15,2) NOT NULL,
FOREIGN KEY(ProductID) REFERENCES ProductInfo(ProductID),
FOREIGN KEY(CustomerID) REFERENCES CustomerInfo(CustomerID),
FOREIGN KEY(SalespersonID) REFERENCES SalespersonInfo(SalespersonID),
FOREIGN KEY(OrderDateID) REFERENCES DateInfo(DateKey),
CONSTRAINT PK_FactSalesOrder PRIMARY KEY  (ProductID,CustomerID,SalespersonID,OrderDateID,OrderNo,ItemNo)
);