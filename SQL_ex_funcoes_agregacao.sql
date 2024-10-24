USE ContosoRetailDW

SELECT
COUNT(CustomerKey) AS 'Qtd. de Clientes'
FROM DimCustomer

SELECT
COUNT(CustomerKey) AS 'Qtd. de Mulheres'
FROM DimCustomer

WHERE Gender = 'F'

SELECT
COUNT(DISTINCT DepartmentName) AS 'Qtd. de Áreas'
FROM DimEmployee

SELECT 
SUM(SalesQuantity) AS 'Total Vendido'
FROM FactSales

WHERE UnitPrice >= 90

SELECT 
AVG(Salesquantity) AS 'Média de Vendas'
FROM FactSales

WHERE UnitPrice >= 100

SELECT 
MIN(SalesQuantity) AS 'Venda Mínima'
FROM FactSales

SELECT 
MIN(SalesQuantity) AS 'Venda Máxima'
FROM FactSales