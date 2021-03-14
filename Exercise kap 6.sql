-- KAPITEL 5
-- EXERCISE 1
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
