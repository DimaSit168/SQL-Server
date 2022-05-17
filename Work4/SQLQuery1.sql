--1. ѕоказать товар, с минимальной разницей между ценой и стандартной стоимостью (не учитывать товары с ценой, равной нулю).
SELECT [Name], ListPrice,
(
	SELECT AVG(ListPrice) 
	FROM Production.Product
) 
	AS StandardCost, ListPrice - 
		(
			SELECT AVG(ListPrice) 
			FROM Production.Product		
		)
	AS Difference
FROM Production.Product
WHERE ProductSubcategoryID = 1;


SELECT [Name], ListPrice, 
(SELECT AVG(ListPrice) 
 FROM Production.Product) AS Average, 
    ListPrice - (SELECT AVG(ListPrice) 
	FROM Production.Product)
    AS Difference
FROM Production.Product
WHERE ProductSubcategoryID = 1;
	

(SELECT MIN(ListPrice) 
FROM Production.Product 
WHERE ListPrice > 0);


--2. ѕоказать самый легкий товар (вес определен и больше нул€)(“аблица Production.Product). ѕоказать пол€ [Name], [Weight].
--SELECT [Name], [Weight]
--FROM Production.Product
--WHERE [Weight] > 0
--ORDER BY Weight;

SELECT [Name], [Weight]
FROM Production.Product
WHERE [Weight] = 
	 (
		SELECT MIN([Weight])
		FROM Production.Product
		WHERE [Weight] > 0
	);

--3. ѕоказать товары, дл€ которых существует более 2 классов, в одном стиле (стиль и класс определен) 
--(“аблица Production.Product). ѕоказать пол€ [Name], Style и Class.

SELECT [Name], Style, Class
FROM Production.Product
WHERE Style IS NOT NULL 
AND Class IS NOT NULL
ORDER BY Class;

SELECT *
FROM Production.Product

SELECT COUNT(DISTINCT p2.Size) AS Size
	,p2.Style AS Stile
FROM Production.Product AS p2
WHERE p2.Style IS NOT NULL
	AND p2.Size IS NOT NULL
GROUP BY p2.Style
HAVING COUNT(DISTINCT p2.Size) > 2;

--4. ѕоказать товары, цена которых равна минимальной (больше нул€) цене товара того же размера (размер определен) 
--(“аблица Production.Product). ѕоказать пол€ [Name], ListPrice и Size.

SELECT p1.[Name]
	,p1.ListPrice
	,p1.Size -- добавим столбец размер
FROM Production.Product AS p1
WHERE
	-- p1.Style = 'M' AND удалим фильтрацию дл€ стил€
	p1.Size IS NOT NULL AND -- и добавл€ем фильтрацию дл€ стил€ на то, что он заполнен
	p1.ListPrice = (
		SELECT MIN(p2.ListPrice)
		FROM Production.Product AS p2
		WHERE p1.Size = p2.Size --добавим условие
		-- p2.Style IS NOT NULL удалим условие
		--GROUP BY p2.Style Ц удалим группировку
	)
ORDER BY p1.Size; --добавлено дл€ удобства анализа

--5. ѕоказать товары, цена которых меньше средней цены в любом цвете (“аблица Production.Product). 
--ѕоказать пол€ [Name], ListPrice и Color.

SELECT [Name], ListPrice, Color
FROM Production.Product
WHERE ListPrice < ANY 
	(SELECT AVG(ListPrice) 
	FROM Production.Product 
	WHERE ListPrice > 0 AND Color IS NOT NULL 
	GROUP BY Color) 
ORDER BY ListPrice DESC;