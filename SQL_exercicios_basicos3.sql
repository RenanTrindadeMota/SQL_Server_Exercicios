USE ContosoRetailDW

-- Exercício 1:
--O gerente comercial pediu a você uma análise da Quantidade Vendida e
--Quantidade Devolvida para o canal de venda mais importante da
--empresa: Store.

SELECT
SUM(SalesQuantity) AS 'Qtd. de Vendas',
SUm(ReturnQuantity) AS 'Qtd. de devoluções'
FROM FactSales

-- Exercício 2:
--Uma nova ação no setor de Marketing precisará avaliar a média salarial
--de todos os clientes da empresa, mas apenas de ocupação Professional.
--Utilize um comando SQL para atingir esse resultado.

SELECT
AVG(YearlyIncome) AS 'Média Salarial de CLientes'
FROM DimCustomer

WHERE Occupation = 'Professional'

-- Exercício 3:
--Você precisará fazer uma análise da quantidade de funcionários das lojas
--registradas na empresa. O seu gerente te pediu os seguintes números e
--informações:
--a.Quantos funcionários tem a loja com mais funcionários?
--b.Qual é o nome dessa loja?
--c.Quantos funcionários tem a loja com menos funcionários?
--d.Qual é o nome dessa loja?


-- Questão A e B:
SELECT TOP(1)
	StoreName,
	EmployeeCount
FROM DimStore

ORDER BY EmployeeCount DESC

-- Questão C e D:
SELECT TOP(1)
	StoreName,
	EmployeeCount
FROM DimStore

WHERE EmployeeCount IS NOT NULL
ORDER BY EmployeeCount

-- Exercício 4:
--A área de RH está com uma nova ação para a empresa, e para isso
--precisa saber a quantidade total de funcionários do sexo Masculino e do
--sexo Feminino.
--a.Descubra essas duas informações utilizando o SQL.
--b.O funcionário e a funcionária mais antigos receberão uma
--homenagem. Descubra as seguintes informações de cada um deles:
--Nome, E-mail, Data de Contratação.

-- Questão A:

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

-- Questão B:

-- funcionária mais antiga.
SELECT TOP(1)
	FirstName,
	EmailAddress,
	HireDate
FROM DimEmployee

WHERE Gender = 'F'
ORDER BY HireDate

-- funcionário mais antigo.
SELECT TOP(1)
	FirstName,
	EmailAddress,
	HireDate
FROM DimEmployee

WHERE Gender = 'M'
ORDER BY HireDate

-- Exercício 5: 
--Agora você precisa fazer uma análise dos produtos. Será necessário
--descobrir as seguintes informações:
--a. Quantidade distinta de cores de produtos.
--b.Quantidade distinta de marcas
--c.Quantidade distinta de classes de produto
--Para simplificar, você pode fazer isso em uma mesma
--consulta.

SELECT
	COUNT(DISTINCT ColorName) AS 'Qtd. de Cores', -- Questão A
	COUNT(DISTINCT BrandName) AS 'Qtd. de Marcas', -- Questão B
	COUNT(DISTINCT ClassName) AS 'Qtd. de Classes' -- Questão C
FROM DimProduct
