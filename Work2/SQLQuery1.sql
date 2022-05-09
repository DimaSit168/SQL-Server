-- 1.	Ќайти количество различных размеров из таблицы Production.Product
SELECT COUNT(DISTINCT Size) 
FROM [Production].[Product];
--WHERE SIZE IS NOT NULL;