USE ContosoRetailDW

-- Exerc�cio 1:
--a. Fa�a um resumo da quantidade vendida (SalesQuantity) de acordo
--com o canal de vendas (channelkey).
--b.Fa�a um agrupamento mostrando a quantidade total vendida
--(SalesQuantity) e quantidade total devolvida (Return Quantity) de
--acordo com o ID das lojas (StoreKey).
--c. Fa�a um resumo do valor total vendido (SalesAmount) para cada
--canal de venda, mas apenas para o ano de 2007.

-- a)
SELECT
	channelKey AS 'ID_Canal',
	SalesQuantity AS 'Qtd. Vendida'	
FROM FactSales

-- b)
SELECT
	StoreKey,
	SUM(SalesQuantity),
	SUM(ReturnQuantity)
FROM FactSales
GROUP BY StoreKey
ORDER BY StoreKey ASC

-- c)
SELECT
	channelKey,
	SUM(SalesQuantity) AS 'Total de Vendas'
FROM FactSales
WHERE DateKey BETWEEN '01/01/2007' AND '31/12/2007'
GROUP BY channelKey

-- Exerc�cio 2:
--Voc� precisa fazer uma an�lise de vendas por produtos. O objetivo final �
--descobrir o valor total vendido (SalesAmount) por produto (ProductKey).
--a. A tabela final dever� estar ordenada de acordo com a quantidade vendida e,
--al�m disso, mostrar apenas os produtos que tiveram um
--resultado final de vendas maior do que $5.000.000.
--b.Fa�a uma adapta��o no exerc�cio anterior e mostre os Top 10 produtos com
--mais vendas. Desconsidere o filtro de $5.000.000 aplicado.

-- a)
SELECT
	ProductKey,
	SUM(SalesAmount) AS 'Total de Vendas'
FROM FactSales
GROUP BY ProductKey
HAVING SUM(SalesAmount) > 5000000
ORDER BY SUM(SalesAmount) DESC

-- b)
SELECT TOP(10)
	ProductKey,
	SUM(SalesAmount) AS 'Total de Vendas'
FROM FactSales
GROUP BY ProductKey
ORDER BY SUM(SalesAmount) DESC

-- Exerc�cio 3:
--a. Voc� deve fazer uma consulta � tabela FactOnlineSales e descobrir qual � o ID (Customerkey)
--do cliente que mais realizou compras online (de acordo com a coluna SalesQuantity).
--b. Feito isso, fa�a um agrupamento de total vendido (SalesQuantity) por ID do produto e
--descubra quais foram os top 3 produtos mais comprados pelo cliente da letra a).

-- a)
SELECT TOP(1)
	CustomerKey,
	COUNT(SalesQuantity) AS 'Qtd. de Vendas'
FROM FactOnlineSales
GROUP BY CustomerKey
ORDER BY COUNT(SalesQuantity) DESC

-- b)
SELECT TOP(3)
	CustomerKey,
	ProductKey,
	COUNT(SalesQuantity) AS 'Qtd. de Vendas'
FROM FactOnlineSales
GROUP BY CustomerKey, ProductKey
HAVING CustomerKey = '19037'
ORDER BY COUNT(SalesQuantity) DESC

-- Exerc�cio 4:
--a. Fa�a um agrupamento e descubra a quantidade total de produtos por marca.
--b Determine a m�dia do pre�o unit�rio (UnitPrice) para cada ClassName. 
--C. Fa�a um agrupamento de cores e descubra o peso total que cada cor de produto possui.

-- a)
SELECT 
	BrandName,
	COUNT(BrandName) AS 'Qtd. de Produtos'
FROM DimProduct
GROUP BY BrandName

-- b)
SELECT
	ClassName,
	AVG(UnitPrice)
FROM DimProduct
GROUP BY ClassName

-- c)
SELECT
	ColorName,
	SUM(weight) 'Peso Total'
FROM DimProduct
GROUP BY ColorName

-- Exerc�cio 5: 
--Voc� dever� descobrir o peso total para cada tipo de produto (StockTypeName). A tabela final deve
--considerar apenas a marca 'Contoso' e ter os seus valores classificados em ordem decrescente.

SELECT
	BrandName,
	StockTypeName,
	SUM(weight) 'Peso Total'
FROM DimProduct
GROUP BY BrandName, StockTypeName
HAVING BrandName = 'Contoso'

-- Exerc�cio 6:
--Voc� seria capaz de confirmar se todas as marcas dos produtos possuem � disposi��o 
--todas as 16 op��es de cores?

SELECT 
	BrandName,
	COUNT(DISTINCT ColorName)
FROM DimProduct
GROUP BY BrandName

-- Exerc�cio 7:
--Fa�a um agrupamento para saber o total de clientes de acordo com o
--Sexo e tamb�m a m�dia salarial de acordo com o Sexo. Corrija
--qualquer resultado �inesperado� com os seus conhecimentos em
--SQL.

SELECT
	Gender,
	COUNT(CustomerKey) AS 'Qtd. de Clientes',
	AVG(YearlyIncome) AS 'M�dia Salarial'
FROM DimCustomer
GROUP BY Gender
HAVING Gender IS NOT NULL

-- Exerc�cio 8:
--Fa�a um agrupamento para descobrir a quantidade total de clientes e a
--m�dia salarial de acordo com o seu n�vel escolar. Utilize a coluna
--Education da tabela DimCustomer para fazer esse agrupamento.

SELECT
	Education AS 'Educa��o',
	COUNT(CustomerKey) AS 'Qtd. de Clientes',
	AVG(YearlyIncome) AS 'M�dia Salarial'
FROM DimCustomer
GROUP BY Education
HAVING Education IS NOT NULL

-- Exerc�cio 9:
--Fa�a uma tabela resumo mostrando a quantidade total de funcion�rios
--de acordo com o Departamento (DepartmentName). Importante: Voc�
--dever� considerar apenas os funcion�rios ativos.

SELECT
	DepartmentName,
	COUNT(EmployeeKey) AS 'Qtd. de Funcion�rios'
FROM DimEmployee
WHERE Status IS NOT NULL
GROUP BY DepartmentName

-- Exerc�cio 10:
--Fa�a uma tabela resumo mostrando o total de VacationHours para cada cargo (Title). 
--Voc� deve considerar apenas as mulheres, dos departamentos de Production, Marketing,
--Engineering e Finance, para os funcion�rios contratados entre os anos de 1999 e 2000.

SELECT 
	DepartmentName,
	Title,
	SUM(VacationHours) 'Hor�rio de F�rias'
FROM DimEmployee
WHERE Gender = 'F' AND
DepartmentName IN ('Production', 'Marketing', 'Engineering', 'Finance') AND
HireDate BETWEEN '1999' AND '2000'
GROUP BY DepartmentName, Title





