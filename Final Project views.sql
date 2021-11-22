/* Final Project Views */

Use TheBananaMen;
/*
Go
-- Updatable Last Contact
Create view LastContact as
Select C.FirstName, C.LastName, E.FirstName as Contact
From Customer as C join Employees as E on C.LastContact = E.EmployeeID;
Go
-- Vendors and Products
Create view VendorProduct as
Select V.[Name] as [Vendor Name], V.Phone, P.[Name] as [Phone Name]
From Vendors as V join Product as P on V.VendID = P.VendID
With check option;
Go
-- Order Status
Create view OrderStatus as
Select O.OrdID, O.DateOpened, C.LastName, C.FirstName, C.Phone, PS.[State]
From Orders as O 
join Customer as C on O.CustID = C.CustID
join PhoneStatus as PS on O.StatusCode = PS.StatusCode
With check option;
Go
-- Vendor to Contact
Create view VendorContact as
Select O.OrdID, P.Name as [Phone Name], V.Name as [Vendor Name], V.Phone
From Orders as O
join Product as P on O.ProdID = P.ProdID
join Vendors as V on V.VendID = P.VendID
With check option;
*/
/*
Update LastContact
Set Contact='Frank'
Where FirstName='Dan'
*/