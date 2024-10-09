USE ContosoRetailDW

-- Exerc�cio 1:
--O gerente comercial pediu a voc� uma an�lise da Quantidade Vendida e
--Quantidade Devolvida para o canal de venda mais importante da
--empresa: Store.

SELECT
SUM(SalesQuantity) AS 'Qtd. de Vendas',
SUm(ReturnQuantity) AS 'Qtd. de devolu��es'
FROM FactSales

-- Exerc�cio 2:
--Uma nova a��o no setor de Marketing precisar� avaliar a m�dia salarial
--de todos os clientes da empresa, mas apenas de ocupa��o Professional.
--Utilize um comando SQL para atingir esse resultado.

SELECT
AVG(YearlyIncome) AS 'M�dia Salarial de CLientes'
FROM DimCustomer

WHERE Occupation = 'Professional'

-- Exerc�cio 3:
--Voc� precisar� fazer uma an�lise da quantidade de funcion�rios das lojas
--registradas na empresa. O seu gerente te pediu os seguintes n�meros e
--informa��es:
--a.Quantos funcion�rios tem a loja com mais funcion�rios?
--b.Qual � o nome dessa loja?
--c.Quantos funcion�rios tem a loja com menos funcion�rios?
--d.Qual � o nome dessa loja?


-- Quest�o A e B:
SELECT TOP(1)
	StoreName,
	EmployeeCount
FROM DimStore

ORDER BY EmployeeCount DESC

-- Quest�o C e D:
SELECT TOP(1)
	StoreName,
	EmployeeCount
FROM DimStore

WHERE EmployeeCount IS NOT NULL
ORDER BY EmployeeCount

-- Exerc�cio 4:
--A �rea de RH est� com uma nova a��o para a empresa, e para isso
--precisa saber a quantidade total de funcion�rios do sexo Masculino e do
--sexo Feminino.
--a.Descubra essas duas informa��es utilizando o SQL.
--b.O funcion�rio e a funcion�ria mais antigos receber�o uma
--homenagem. Descubra as seguintes informa��es de cada um deles:
--Nome, E-mail, Data de Contrata��o.

-- Quest�o A:

-- quantidade de homens.
SELECT 
	COUNT(EmployeeKey)
FROM DimEmployee

WHERE Gender = 'M'

-- quantidade de mulheres.
SELECT 
	COUNT(EmployeeKey)
FROM DimEmployee

WHERE Gender = 'F'

-- Quest�o B:

-- funcion�ria mais antiga.
SELECT TOP(1)
	FirstName,
	EmailAddress,
	HireDate
FROM DimEmployee

WHERE Gender = 'F'
ORDER BY HireDate

-- funcion�rio mais antigo.
SELECT TOP(1)
	FirstName,
	EmailAddress,
	HireDate
FROM DimEmployee

WHERE Gender = 'M'
ORDER BY HireDate

-- Exerc�cio 5: 
--Agora voc� precisa fazer uma an�lise dos produtos. Ser� necess�rio
--descobrir as seguintes informa��es:
--a. Quantidade distinta de cores de produtos.
--b.Quantidade distinta de marcas
--c.Quantidade distinta de classes de produto
--Para simplificar, voc� pode fazer isso em uma mesma
--consulta.

SELECT
	COUNT(DISTINCT ColorName) AS 'Qtd. de Cores', -- Quest�o A
	COUNT(DISTINCT BrandName) AS 'Qtd. de Marcas', -- Quest�o B
	COUNT(DISTINCT ClassName) AS 'Qtd. de Classes' -- Quest�o C
FROM DimProduct
