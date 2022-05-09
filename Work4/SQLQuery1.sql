--1. Показать товар, с минимальной разницей между ценой и стандартной стоимостью (не учитывать товары с ценой, равной нулю).
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
(SELECT AVG(ListPrice) FROM Production.Product) AS Average, 
    ListPrice - (SELECT AVG(ListPrice) FROM Production.Product)
    AS Difference
FROM Production.Product
WHERE ProductSubcategoryID = 1;


(SELECT MIN(ListPrice) 
FROM Production.Product 
WHERE ListPrice > 0);


--2. Показать самый легкий товар (вес определен и больше нуля)(Таблица Production.Product). Показать поля [Name], [Weight].
SELECT [Name], Weight
FROM Production.Product
WHERE Weight > 0
ORDER BY Weight;

--3. Показать товары, для которых существует более 2 классов, в одном стиле (стиль и класс определен) 
--(Таблица Production.Product). Показать поля [Name], Style и Class.

SELECT [Name], Style, Class
FROM Production.Product
WHERE Style IS NOT NULL 
AND Class IS NOT NULL
ORDER BY Class;

--4. Показать товары, цена которых равна минимальной (больше нуля) цене товара того же размера (размер определен) 
--(Таблица Production.Product). Показать поля [Name], ListPrice и Size.

SELECT [Name], ListPrice, Size
FROM Production.Product
WHERE ListPrice > 0
AND Size IS NOT NULL
ORDER BY ListPrice;

--5. Показать товары, цена которых меньше средней цены в любом цвете (Таблица Production.Product). 
--Показать поля [Name], ListPrice и Color.

SELECT [Name], ListPrice, Color
FROM Production.Product
WHERE ListPrice < ANY 
	(SELECT AVG(ListPrice) 
	FROM Production.Product 
	WHERE ListPrice > 0 AND Color IS NOT NULL 
	GROUP BY Color) 
ORDER BY ListPrice DESC;