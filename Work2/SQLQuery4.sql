-- 4.	Найти линейку продуктов ProductLine из таблицы Production.Product, где максимальный вес меньше 500 
-- (из выборки исключить пустые поля).
SELECT MAX(Weight) AS Weight, ProductLine
FROM Production.Product
WHERE ProductLine IS NOT NULL
GROUP BY ProductLine
HAVING MAX(Weight) < 500;