-- 4. Показать список цветов продуктов (Color), которые имеют несколько размеров (Size)
-- из таблицы , используя SELF JOIN.
SELECT DISTINCT p1.Color 			
FROM Production.Product AS p1
INNER JOIN Production.Product AS p2
ON p1.Color <> p2.Size
AND p1.Color = p2.Color
WHERE p1.Size IS NOT NULL;

 --,p1.Size,p1.Size,p1.[Name],e.Size

--e.[Name],

SELECT DISTINCT e.Color, e.Size, e.[Name]
FROM Production.Product AS e
INNER JOIN Production.Product AS m
ON e.Color = m.Color
AND e.Size <> m.Size
ORDER BY e.Color