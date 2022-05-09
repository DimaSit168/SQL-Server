-- 4.	Показать все наименования модели «рама» (Frame) поля [Name] и ProductModelID, из таблицы Production.ProductModel.
SELECT 	[Name],
		ProductModelID
FROM Production.ProductModel
WHERE Name LIKE '%Frame';