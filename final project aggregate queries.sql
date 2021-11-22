Use TheBananaMen;
/*
Select MIN(FirstName) as [First Listed Employee], Max(FirstName) as [Last Listed Employee], Count(FirstName) as [Total Employees]
From Employees;
*/
/*
Select FirstName, Postcode, count (*) as [Customers in area]
From Customer
Group by Postcode, FirstName with rollup;
*/
/*
Select C.CustID, C.LastName, C.FirstName, count(O.OrdID) as [# of Orders]
From Customer as C join Orders as O on C.CustID = O.CustID
Group by C.CustID, C.LastName, C.FirstName;
*/
/*
Select P.State, count(*) as [Total Phones With Status]
From PhoneStatus as P join Orders as O on P.StatusCode = O.StatusCode
Group by P.State;
*/