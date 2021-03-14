-- KAPITEL 5
-- EXERCISE 5-1
/*
The HumanResources.Employee table does not contain the employee names. 
Join that table to the Person.Person table on the BusinessEntityID column. 
Display the job title, birth date, first name, and last name. 2.
*/
SELECT HE.JobTitle, HE.BirthDate, PP.FirstName, PP.LastName
FROM AdventureWorks2019.HumanResources.Employee HE
INNER JOIN AdventureWorks2019.Person.Person PP ON PP.BusinessEntityID = HE.BusinessEntityID

-- EXERCISE 2
/*
The customer names also appear in the Person.Person table. 
Join the Sales.Customer table to the Person.Person table. 
The BusinessEntityID column in the Person.Person table matches the PersonID column in the Sales.Customer table. 
Display the CustomerID, StoreID, and TerritoryID columns along with the name columns.
*/
SELECT SC.CustomerID, SC.StoreID, SC.TerritoryID, PP.FirstName, PP.LastName
FROM Sales.Customer SC
INNER JOIN Person.Person PP ON PP.BusinessEntityID = SC.PersonID

-- EXERCISE 3
/*
Extend the query written in Question 2 to include the Sales.SalesOrderHeader table. 
Display the SalesOrderID column along with the columns already specified. 
The Sales.SalesOrderHeader table joins the Sales.Customer table on CustomerID.
*/
SELECT SC.CustomerID, StoreID, SC.TerritoryID, PP.FirstName, PP.LastName, SOH.Freight, SOH.SalesOrderID
FROM Sales.Customer SC
INNER JOIN Person.Person PP ON PP.BusinessEntityID = SC.PersonID
INNER JOIN Sales.SalesOrderHeader SOH ON SOH.CustomerID = SC.CustomerID

-- EXERCISE 4
/*
Write a query that joins the Sales.SalesOrderHeader table to the Sales.SalesPerson table. 
Join the BusinessEntityID column from the Sales.SalesPerson table to the SalesPersonID column in the Sales.SalesOrderHeader table. 
Display the SalesOrderID along with the SalesQuota and Bonus.
*/
SELECT SOH.SalesOrderID, ISNULL(SP.SalesQuota, 0) AS SalesQuota, sp.Bonus
FROM Sales.SalesOrderHeader SOH 
INNER JOIN Sales.SalesPerson SP ON SP.BusinessEntityID = SOH.SalesPersonID

-- EXERCISE 5
/*
Add the name columns to the query written in Question 4 by joining on the Person.Person table. 
See whether you can figure out which columns will be used to write the join.
*/

SELECT SOH.SalesOrderID, ISNULL(SP.SalesQuota, 0) AS SalesQuota, SP.Bonus, PP.FirstName, PP.LastName
FROM Sales.SalesOrderHeader SOH 
INNER JOIN Sales.SalesPerson SP ON SP.BusinessEntityID = SOH.SalesPersonID
INNER JOIN Person.Person PP ON PP.BusinessEntityID = SP.BusinessEntityID

-- EXERCISE 6
/*
Switch to the WideWorldImporters database. 
Join the Application.Countries table with the Application.StateProvinces table. 
Use an INNER JOIN, returning only the CountryName and Subregion from the Application.Countries table and the StateProvinceName from the Application.StateProvinces table. 
Hint: Use CountryID as the JOIN column to join the two tables.
*/
SELECT CountryName, Subregion, StateProvinceName
FROM WideWorldImporters.Application.Countries AC
JOIN WideWorldImporters.Application.StateProvinces ASP ON ASP.CountryID = AC.CountryID

-- EXERCISE 7
/*
Write the preceding query using aliases as the book did to eliminate the use of full table names to qualify the columns.
*/

-- Jeg bruger altid aliases ved joins


-- EXERCISE 5-2
-- 1
/*
Write a query that displays all the products along with the SalesOrderID even if an order has never been placed for that product. 
Join to the Sales.SalesOrderDetail table using the ProductID column. 2.
*/
SELECT SOD.SalesOrderID, P.* 
FROM Production.Product P
LEFT OUTER JOIN Sales.SalesOrderDetail SOD ON SOD.ProductID = p.ProductID

-- 2
/*
Change the query written in Question 1 so that only products that have not been ordered show up in the query.
*/
SELECT SOD.SalesOrderID, P.* 
FROM Production.Product P
LEFT OUTER JOIN Sales.SalesOrderDetail SOD ON SOD.ProductID = p.ProductID
WHERE SOD.SalesOrderID IS NULL

-- 3
/*
Write a query that returns all the rows from the Sales.SalesPerson table joined to the Sales.SalesOrderHeader table along with the SalesOrderID column even if no orders match. 
Include the SalesPersonID, SalesYTD, and SalesOrderID columns in the results.
*/
SELECT SOH.SalesOrderID, SOH.SalesPersonID, SP.SalesYTD, *
FROM Sales.SalesPerson SP 
LEFT OUTER JOIN Sales.SalesOrderHeader SOH ON SOH.rowguid = SP.rowguid

-- 4
/*
Change the query written in Question 3 so that the salesperson’s name also displays from the Person.Person table.
*/

SELECT P.FirstName, P.LastName, SOH.SalesOrderID, SOH.SalesPersonID, SP.SalesYTD, *
FROM Sales.SalesPerson SP 
LEFT OUTER JOIN Sales.SalesOrderHeader SOH ON SOH.SalesPersonID = SP.BusinessEntityID
INNER JOIN Person.Person P ON P.BusinessEntityID = SP.BusinessEntityID

-- 5
/*
The Sales.SalesOrderHeader table contains foreign keys to the Sales.CurrencyRate and Purchasing.ShipMethod tables. 
Write a query joining all three tables, and make sure it contains all rows from Sales.SalesOrderHeader. 
Include the CurrencyRateID, AverageRate, SalesOrderID, and ShipBase columns.
*/

SELECT CR.CurrencyRateID, CR.AverageRate, SOH.SalesOrderID, SM.ShipBase, SOH.*
FROM Sales.SalesOrderHeader SOH 
LEFT OUTER JOIN Sales.CurrencyRate CR ON CR.CurrencyRateID = SOH.CurrencyRateID
LEFT OUTER JOIN Purchasing.ShipMethod SM ON SM.ShipMethodID = SOH.ShipMethodID

-- 6
/*
Switch to the WideWorldImporters database. 
Query the sys.sysobjects internal table and note how many rows are returned. 
What if you CROSS JOIN the table to itself? 
How many rows will return? (Avoid running this in a production system.)
*/

SELECT *
FROM WideWorldImporters.sys.sysobjects
-- (418 rows affected)
-- Total execution time: 00:00:00.060

SELECT *
FROM WideWorldImporters.sys.sysobjects AS T1
CROSS JOIN WideWorldImporters.sys.sysobjects AS T2
--(174724 rows affected)
--Total execution time: 00:00:12.776
