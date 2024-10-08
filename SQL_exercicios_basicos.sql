use ContosoRetailDW

SELECT ProductKey
FROM DimProduct
-- há exatamente 2.517 produtos cadastrados na base.

SELECT CustomerKey
FROM DimCustomer
-- o número de clientes diminuiu para 18.869 pessoas

SELECT CustomerKey,
		FirstName,
		EmailAddress,
		BirthDate
FROM DimCustomer
--tabela de cliente com nome,email e data de aniversário.

SELECT CustomerKey AS id_cliente,
		FirstName AS nome_cliente,
		EmailAddress AS email_cliente,
		BirthDate AS data_aniversario
FROM DimCustomer
--tabela de cliente com nome,email e data de aniversário com nomeclaturas alteradas.

SELECT TOP(100) *
FROM DimCustomer
WHERE DateFirstPurchase < '2024/10/04'
ORDER BY DateFirstPurchase ASC

SELECT TOP(10) PERCENT *
FROM DimCustomer
WHERE DateFirstPurchase < '2024/10/04'
ORDER BY DateFirstPurchase ASC

SELECT TOP(100) FirstName, EmailAddress, BirthDate
FROM DimCustomer
WHERE DateFirstPurchase < '2024/10/04'
ORDER BY DateFirstPurchase ASC

SELECT FirstName AS nome_cliente,
		EmailAddress AS email_cliente, 
		BirthDate AS data_nascimento
FROM DimCustomer

SELECT DISTINCT Manufacturer AS fabricante
FROM DimProduct

SELECT DISTINCT * 
FROM DimProduct;
SELECT DISTINCT ProductKey
FROM FactSales
