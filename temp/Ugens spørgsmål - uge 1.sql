-- Ugens spørgsmål

SELECT count(*)
FROM AdventureWorks2019.Person.Person

SELECT [AddressID]
      ,[AddressLine1]
      ,[AddressLine2]
      ,[City]
      ,[StateProvinceID]
      ,[PostalCode]
      ,[SpatialLocation]
      ,[rowguid]
      ,[ModifiedDate]
FROM [AdventureWorks2019].[Person].[Address]

--Mærkeligt jeg har ikke nogen tabel der rimer på PostalCodes eller City

SELECT count(*)
FROM Person.Address
--19614


SELECT postalcode, count(PostalCode), city, count(City)
FROM Person.Address
GROUP BY PostalCode, City
