-- 8.	Показать поля ProductID, [Name] из таблицы Production.Product с применением функции COALESCE(). Показать поле 
--		Measurement, так, чтобы, если значение в поле Class известно, то показать его, а иначе, показать значение 
--		в поле Color. Если и в поле Color значение неизвестно, то вывести значение 'UNKNOWN'.
SELECT [ProductID], [Name], [Class], [Color],
--		COALESCE ([ProductID], [Name]) AS Measurement
		COALESCE (Class, Color, 'UNKNOWN') AS Measurement
--		CAST ([Class] AS VARCHAR(10)), 'UNKNOWN') AS Measurement	
--		NULLIF (Class, Color) AS Measurement
FROM [Production].[Product];