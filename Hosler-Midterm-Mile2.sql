Create database TheBananaMen;
Go
-- Step 1, 2, & 3
Use TheBananaMen;
Create table Employees(
	EmployeeID int Not null,
	LastName varchar(30) Not null,
	FirstName varchar(30) Not null,
	MiddleName varchar(30),
	Role varchar(30),
	Primary key(EmployeeID)
);
Go
Create table Customer(
	CustID int Not null,
	LastName varchar(30) Not null,
	FirstName varchar(30) Not null,
	Address varchar(50),
	City varchar(50),
	State varchar(2),
	Postcode int,
	Phone varchar(12) Not null,
	LastContact int Not null,
	Primary key(CustID),
	Constraint FK_LastContact foreign key(LastContact) references Employees(EmployeeID)
);
Go
Create table Vendors(
	VendID int Not null,
	Name varchar(50) Not null,
	Phone varchar(12) Not null,
	Primary key(VendID)
);
Go
Create table Product(
	ProdID int Not null,
	Name varchar(30) Not null,
	VendID int Not null, -- F
	Primary key(ProdID),
	Constraint FK_VendID foreign key(VendID) references Vendors(VendID)
);
Go
Create table PhoneStatus(
	StatusCode varchar(1) Not null,
	State varchar(50) Not null,
	Primary key(StatusCode)
);
Go
Create table Orders(
	OrdID int Not null,
	DateOpened varchar(10) Not null,
	StatusCode varchar(1) Not null, -- FK
	CustID int Not null, -- FK
	ProdID int Not null, -- FK
	Primary key(OrdID),
	Constraint FK_StatusCode foreign key(StatusCode) references PhoneStatus(StatusCode),
	Constraint FK_CustID foreign key(CustID) references Customer(CustID),
	Constraint FK_ProdID foreign key(ProdID) references Product(ProdID)
);
Go
Create index idx_LastContact on Customer(LastContact);
Go
Create index idx_VendID on Product(VendID);
Go
Create index idx_StatusCode on Orders(StatusCode);
Go
Create index idx_CustID on Orders(CustID);
Go
Create index idx_ProdID on Orders(ProdID);
Go