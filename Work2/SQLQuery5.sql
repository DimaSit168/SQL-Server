-- 5.	ѕоказать наименование товара, цену и цвет. –азбить ответ на п€ть равных частей, упор€дочив по возрастанию цены.
--SELECT RANK() OVER (ORDER BY ListPrice) AS N
SELECT NTILE(5) OVER (ORDER BY ListPrice) AS N
	 , [Name]
	 , ListPrice
	 , Color
FROM Production.Product
WHERE ListPrice > 0;