-- 3.	Показать среднюю цену товара в каждой линейке продуктов ProductLine из таблицы Production.Product 
-- (из выборки исключить пустые поля).
SELECT ProductLine, AVG(StandardCost) AS StandardCost	--среднее
--	,COUNT(StandardCost) AS id			--количество
FROM Production.Product
WHERE ProductLine IS NOT NULL
GROUP BY ProductLine;