USE ContosoRetailDW

SELECT 
	DimProductSubcategory.ProductSubcategoryKey,
	SUM(DimProduct.UnitPrice) AS 'Total de vendas'

FROM DimProductSubcategory
FULL JOIN 
	DimProduct
ON 
	DimProductSubcategory.ProductSubcategoryKey = DimProduct.ProductSubcategoryKey
GROUP BY
	DimProductSubcategory.ProductSubcategoryKey
ORDER BY DimProductSubcategory.ProductSubcategoryKey

-- O FULL JOIN FOI USADO PARA JUNTAR A TABELA DE PRODUTOS COM A TABELA DE SUBCATEGORIA
-- ATRAVÉS DA COLUNA "ProductSubcaegoryKey"