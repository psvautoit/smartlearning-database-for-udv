-- Create a new stored procedure called 'GetBooks' in schema 'Fanzy'
-- Drop the stored procedure if it already exists
IF EXISTS (
SELECT *
    FROM INFORMATION_SCHEMA.ROUTINES
WHERE SPECIFIC_SCHEMA = N'Fanzy'
    AND SPECIFIC_NAME = N'GetBooks'
    AND ROUTINE_TYPE = N'PROCEDURE'
)
DROP PROCEDURE Fanzy.GetBooks
GO
-- Create the stored procedure in the specified schema

CREATE PROCEDURE Fanzy.GetBooks
    @BookISBN BIGINT

AS

BEGIN
    SELECT *
    FROM Book
    WHERE ISNULL(@BookISBN, ISBN) = ISBN

END



