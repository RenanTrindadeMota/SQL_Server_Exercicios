USE ContosoRetailDW

SELECT
COUNT(CustomerKey) AS 'Qtd. de Clientes'
FROM DimCustomer

SELECT
COUNT(CustomerKey) AS 'Qtd. de Mulheres'
FROM DimCustomer

WHERE Gender = 'F'

SELECT
COUNT(DISTINCT DepartmentName) AS 'Qtd. de �reas'
FROM DimEmployee

SELECT 
SUM(SalesQuantity) AS 'Total Vendido'
FROM FactSales

WHERE UnitPrice >= 90

SELECT 
AVG(Salesquantity) AS 'M�dia de Vendas'
FROM FactSales

WHERE UnitPrice >= 100

SELECT 
MIN(SalesQuantity) AS 'Venda M�nima'
FROM FactSales

SELECT 
MIN(SalesQuantity) AS 'Venda M�xima'
FROM FactSales