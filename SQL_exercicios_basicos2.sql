USE ContosoRetailDW

SELECT TOP(100)
*
FROM FactSales 

ORDER BY SalesAmount DESC
--exercício 1 das 100 maiores vendas.

SELECT TOP(10)
	ProductName
	UnitPrice,
	Weight
FROM DimProduct

ORDER BY UnitPrice DESC, Weight DESC

SELECT 
	ProductName,
	Weight
FROM DimProduct

WHERE Weight >= 220

SELECT DISTINCT
	StoreName AS Nome_da_Empresa,
	OpenDate AS Data_abertura,
	EmployeeCount AS quantidade_funcionários
FROM DimStore

WHERE Status LIKE 'On'

SELECT 
	ProductKey,
	ProductName,
	AvailableForSaleDate
FROM DimProduct

WHERE AvailableForSaleDate = '15-03-2009' AND ProductName LIKE '%Home Theater%'

SELECT
	StoreName,
	Status
FROM DimStore

WHERE Status LIKE 'Off'

SELECT
	StoreName,
	CloseDate
FROM DimStore

WHERE CloseDate IS NOT NULL

SELECT 
	StoreName,
	EmployeeCount
FROM DimStore

WHERE EmployeeCount BETWEEN 1 AND 20

SELECT 
	StoreName,
	EmployeeCount
FROM DimStore

WHERE EmployeeCount BETWEEN 20 AND 50

SELECT 
	StoreName,
	EmployeeCount
FROM DimStore

WHERE EmployeeCount > 50

SELECT 
	ProductKey,
	ProductName,
	UnitPrice
FROM DimProduct

WHERE ProductName LIKE '%LCD%'

SELECT 
	ProductName,
	ColorName,
	BrandName
FROM DimProduct

WHERE ColorName IN ('Green', 'Orange', 'Black', 'Silver', 'Pink') AND BrandName IN ('Contoso','Litware','Fabrikam')