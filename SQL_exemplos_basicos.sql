USE ContosoRetailDW

SELECT TOP(100)
	StoreName,
	EmployeeCount
FROM DimStore

ORDER BY EmployeeCount

SELECT TOP(100)
	StoreName,
	EmployeeCount
FROM DimStore

ORDER BY EmployeeCount

SELECT 
*
FROM DimProduct

WHERE ProductName LIKE '%MP3%'

SELECT
*
FROM DimProduct

WHERE BrandName = 'Contoso' AND ColorName = 'Silver'

SELECT
*
FROM DimProduct

WHERE ColorName = 'Blue' OR ColorName = 'Silver'

SELECT
*
FROM DimProduct

WHERE NOT ColorName = 'Silver'

SELECT
*
FROM DimProduct

WHERE ColorName IN ('Blue', 'Silver', 'Black')

SELECT
*
FROM DimProduct

WHERE ColorName NOT IN ('Blue', 'Silver', 'Black')

SELECT TOP(1000) 
*
FROM FactSales

WHERE SalesQuantity BETWEEN 10 AND 15

SELECT 
*
FROM DimCustomer

WHERE FirstName IS NOT NULL

SELECT 
*
FROM DimCustomer

WHERE FirstName IS NULL