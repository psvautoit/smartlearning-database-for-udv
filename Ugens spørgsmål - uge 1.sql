-- Ugens spørgsmål

SELECT count(*)
FROM AdventureWorks2019.Person.Person


SELECT PostalCode, City,  *
FROM Person.Address

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