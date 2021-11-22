Use TheBananaMen;
Go

/* Final Project Procedures */
/*
Create Proc findProductsOrdered
	@OrderID int = 0
As
Begin
	Select O.DateOpened, O.StatusCode, P.Name
	From Orders as O join Product as P on O.ProdID = P.ProdID
	Where O.ProdID like @OrderID;
End
Go
*/
--findProductsOrdered 1
/*
Create Proc findCustomer
	@CustID int = 0,
	@CustName varchar(40) output
As
Select @CustName = LastName + ', ' + FirstName
From Customer
Where CustID like @CustID;
Go
*/
/*
Declare @CustName varchar(40);
exec findCustomer 5, @CustName output
Select @CustName as [Customer Name]
*/
/*
Create Proc countProductsOrdered
	@OrderID int = 0
As
Declare @ProductCount int;
Select @ProductCount = COUNT(ProdID)
From Orders
Where ProdID like @OrderID;
Return @ProductCount;
Go
*/
/*
DECLARE @ProductCount int;
EXEC @ProductCount = countProductsOrdered 1;
PRINT 'Product Count: ' + CONVERT(varchar, @ProductCount);
GO
*/
/* Final Project User Defined Functions */
/*
CREATE FUNCTION productVendor
    (@ProdID int)
    RETURNS int
BEGIN
    RETURN (SELECT VendID 
	FROM Product
	WHERE ProdID = @ProdID);
END;
*/
/*
Select Name, Phone
From Vendors
Where VendID = dbo.productVendor(4);
*/
/*
Create function listEmployee
	(@EmployeeID int)
	returns table
Return
	Select * from Employees where @EmployeeID=EmployeeID;
*/
--Select * from dbo.listEmployee(1)

/* Final Project Triggers */
--Select * into testOrders from Orders;
/*
Create table orderLogs(
	OrderID int,
	DateOpened varchar(10)
	Action varchar(30)
);
*/
/*
create table deletedOrders(
	OrderID int,
	DateOpened varchar(10),
	StatusCode varchar(1),
	CustID int,
	ProdID int
);
*/
/*
Create trigger archiveDeleted on Orders
	after Delete
as
begin
	Set nocount on;
	Declare @OrdID int,
		@DateOpened varchar(10),
		@StatusCode varchar(1),
		@CustID int,
		@ProdID int
	Select @OrdID=deleted.OrdID, @DateOpened=deleted.DateOpened, @StatusCode=deleted.StatusCode, @CustID=deleted.CustID, @ProdID=deleted.ProdID
	From deleted 
	
	insert into deletedOrders 
	values(@OrdID, @DateOpened, @StatusCode, @CustID, @ProdID)
end
*/
--Delete from Orders Where OrdID=1;
--Select * from deletedOrders;
/*
Create trigger logInserts on Orders
	after Insert
as
begin
	Set nocount on;
	Declare @OrdID int,
		@DateOpen varchar(10)

	Select @OrdID = OrdID, @DateOpen = DateOpened
	From inserted

	Insert into orderLogs
	values(@OrdID, @DateOpen, 'Inserted')
end
*/

--Insert into Orders values (1,'1/23/2021','O',1,5)
--Select * from orderLogs;
/*
Create trigger logUpdates on Orders
	after Update
as
begin
	Set nocount on;
	Declare @OrdID int,
		@DateOpen varchar(10)

	Select @OrdID = OrdID, @DateOpen = DateOpened
	From inserted

	Insert into orderLogs
	values(@OrdID, @DateOpen, 'Updated')
end
*/
/*
UPDATE Orders SET StatusCode='O' WHERE OrdID = 6;
Select * from orderLogs;
*/