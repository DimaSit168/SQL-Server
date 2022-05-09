--1.Показать товар с !!!самой большой!!! разницей в цене и стандартной цене (Таблица Production.Product). Вывести поля
--StandardCost, ListPrice, [Name].

--DECLARE @I MONEY;
--SET @I = (SELECT MAX(ListPrice) 
--			FROM Production.Product 
--			WHERE ListPrice > 0);
--PRINT @I;
--SELECT [Name], ListPrice 
--FROM Production.Product 
--WHERE ListPrice = @I;

--SELECT [Name], ListPrice 
--FROM Production.Product 
--WHERE ListPrice =
--	( SELECT MAX(ListPrice) 
--	FROM Production.Product 
--	WHERE ListPrice > 0 );

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

SELECT MAX(ListPrice - StandardCost) as Difference
FROM Production.Product

--2.Показать количество сотрудников и должность (JobTitle), на которой работает максимальное количество сотрудников 
--(Представление [HumanResources].[vEmployeeDepartment]).

SELECT FirstName, JobTitle, StartDate 
FROM HumanResources.vEmployeeDepartment
WHERE MIN(BusinessEntityID) IN
	(SELECT BusinessEntityID
	FROM HumanResources.vEmployeeDepartment)

SELECT *--MAX(JobTitle) AS JobTitle
FROM HumanResources.vEmployeeDepartment  -- what???

--DECLARE @I MONEY;
--SET @I = (SELECT MAX(ListPrice) 
--			FROM Production.Product 
--			WHERE ListPrice > 0);
--PRINT @I;
--SELECT [Name], ListPrice 
--FROM Production.Product 
--WHERE ListPrice = @I;

SELECT *
(
	SELECT COUNT(FirstName) --AS Job, BusinessEntityID
	FROM HumanResources.vEmployeeDepartment  -- what???
)
AS Fiver
FROM HumanResources.vEmployeeDepartment

	( SELECT COUNT(JobTitle))


SELECT LastName, FirstName
FROM Person.Person
WHERE BusinessEntityID IN
    (SELECT BusinessEntityID
     FROM HumanResources.Employee
     WHERE BusinessEntityID IN
        (SELECT BusinessEntityID
         FROM Sales.SalesPerson)
    );

SELECT LastName, FirstName
FROM Person.Person c
INNER JOIN HumanResources.Employee e
ON c.BusinessEntityID = e.BusinessEntityID
JOIN Sales.SalesPerson s 
ON e.BusinessEntityID = s.BusinessEntityID;


--3.Показать количество городов и штат (StateProvinceID), в котором находится минимальное количество городов 
--(Таблица Person.[Address])

SELECT COUNT(City) Sity, COUNT(StateProvinceID) StateProvinceID
FROM Person.[Address]

SELECT DISTINCT e.City, e.StateProvinceID--, e.[Name]
FROM Person.[Address] AS e
INNER JOIN Person.[Address] AS m
ON e.City = m.City
AND e.StateProvinceID <> m.StateProvinceID
ORDER BY e.City

--4.Показать товары с максимальной ценой в каждой линейки продуктов (линейка продуктов определена) 
--(Таблица Production.Product). Показать поля [Name], ListPrice и ProductLine.

--Пример 10 Для каждого стиля показать товары с максимальной ценой (стиль определен).
SELECT MAX(p2.ListPrice) MaxList--, [Name], MAX(ListPrice), ProductLine--
FROM Production.Product AS p2
WHERE (p2.ListPrice) IS NOT NULL 
GROUP BY p2.ListPrice; 

SELECT MIN(ListPrice)
FROM Production.Product
WHERE ListPrice > 0 
--GROUP BY ListPrice;

SELECT p1.[Name], p1.ListPrice 
FROM Production.Product AS p1 
WHERE p1.Style = 'M' 
AND p1.ListPrice = 89.99

SELECT p1.[Name] ,p1.ListPrice ,p1.Style -- добавим столбец стиль 
FROM Production.Product AS p1 
WHERE 
	 p1.Style = 'M' AND --удалим фильтрацию для стиля 
	p1.Style IS NOT NULL AND -- и добавляем фильтрацию для стиля на то, что он заполнен 
	p1.ListPrice = (SELECT MAX(p2.ListPrice) 
	FROM Production.Product AS p2 
	WHERE p1.Style = p2.Style --добавим условие 
	 p2.Style IS NOT NULL --удалим условие 
	GROUP BY p2.Style )-- удалим группировку  
	ORDER BY p1.Style; --добавлено для удобства анализа

--5.Показать товары, цена которых меньше средней цены в любом цвете (Таблица Production.Product). Показать поля [Name], 
--ListPrice и Color

SELECT [Name], ListPrice, Color
FROM Production.Product
WHERE 

--Пример 6 Показать товары, цена которых меньше максимальной средней цены в каждом цвете.
SELECT [Name] ,ListPrice 
FROM Production.Product 
WHERE ListPrice < ANY 
	(SELECT AVG(ListPrice) 
	FROM Production.Product 
	WHERE ListPrice > 0 AND Color IS NOT NULL 
	GROUP BY Color) 
ORDER BY ListPrice DESC;

--Пример 9 Показать товары, цена которых меньше любой средней цены в каждом цвете. Решение с помощью двойного вложенного 
--подзапроса.
SELECT MAX(AvgListPrice) 
FROM 
	( 
		SELECT AVG(ListPrice) AS AvgListPrice 
		FROM Production.Product 
		WHERE ListPrice > 0 
		AND Color IS NOT NULL 
		GROUP BY Color 
	) AS T;


SELECT [Name], ListPrice 
FROM Production.Product 
WHERE ListPrice < 
	( 
		SELECT MAX(AvgListPrice) 
		FROM 
			( 
				SELECT AVG(ListPrice) AS AvgListPrice 
				FROM Production.Product 
				WHERE ListPrice > 0 AND Color IS NOT NULL 
				GROUP BY Color 
			) AS T 
	) 
ORDER BY ListPrice DESC;

---

SELECT StandardCost, ListPrice, [Name]
FROM Production.Product
WHERE StandardCost > 0


SELECT *, JobTitle--, SUM(Name) 
FROM [HumanResources].[vEmployeeDepartment]

SELECT MAX(AvgListPrice) 
FROM ( SELECT AVG(ListPrice) AS AvgListPrice 
FROM Production.Product WHERE ListPrice > 0 
AND Color IS NOT NULL 
GROUP BY Color ) AS T;

--ANY (больше минимального или меньше максимального)
--Показать товары, у которых цена выше, чем средняя цена в любом размере 
SELECT [Name], ListPrice
FROM Production.Product
WHERE ListPrice > ANY
(
	SELECT 
	--TOP 1
		AVG(ListPrice)
	FROM Production.Product
	GROUP BY Size
	--ORDER BY AVG(ListPrice)
)
ORDER BY ListPrice

--Показать товары, у которых цена ниже, чем средняя цена в любом размере 
SELECT [Name], ListPrice
FROM Production.Product
WHERE ListPrice <ANY
(
	SELECT 
	--TOP 1
		AVG(ListPrice)
	FROM Production.Product
	GROUP BY Size
	--ORDER BY AVG(ListPrice) DESC
)
ORDER BY ListPrice

--ALL
--(Если больше, чем все, то значит, что больше максимального из множества)
SELECT [Name], ListPrice
FROM Production.Product
WHERE ListPrice > ALL
(
	SELECT 
	--TOP 1
		AVG(ListPrice)
	FROM Production.Product
	GROUP BY Size
	--ORDER BY AVG(ListPrice)
)
ORDER BY ListPrice

--(Если меньше, чем все, то значит, что меньше минимального из множества)
SELECT [Name], ListPrice
FROM Production.Product
WHERE ListPrice < ALL
(
	SELECT 
	--TOP 1
		AVG(ListPrice)
	FROM Production.Product
	GROUP BY Size
	--ORDER BY AVG(ListPrice)
)
ORDER BY ListPrice

--EXIST

SELECT s.FirstName, s.City
FROM Sales.vSalesPerson AS s
WHERE s.StateProvinceName = 'Ontario'
	AND EXISTS
	(SELECT *
	FROM Sales.vSalesPerson)

--Показать удельный вес каждой продажи в общей стоимости всех продаж.
--SELECT
--	  s1.ID
--	, s1.ID_Product
--	, s1.Data_Sale
--	, CAST(
--		(s1.Price * s1.Quantity * 100)/
--		(SELECT SUM(s2.Price * s2.Quantity)
--		 FROM Sale AS s2
--		 WHERE s2.ID_Product = s1.ID_Product)
--	    AS NUMERIC(5, 2)) AS [Percentage]
--FROM Sale AS s1

--Показать удельный вес продажи каждого продукта в общей стоимости всех его продаж.
SELECT s1.ProductID
     , s1.LineTotal
	 , CAST(
		(100.0 * s1.LineTotal / 
			(SELECT SUM(s2.LineTotal) 
			FROM Sales.SalesOrderDetail AS s2
			WHERE s1.ProductID = s2.ProductID)) 
			AS NUMERIC (5, 2)) AS [Percentage]
FROM Sales.SalesOrderDetail AS s1

--Проверка вышерасположенного запроса.
--Для каждого продукта процент суммарный должен быть примерно 100
SELECT SUM(T.[Percentage]), T.ProductID
FROM (SELECT s1.ProductID
     , s1.LineTotal
	 , CAST(
		(100.0 * s1.LineTotal / 
			(SELECT SUM(s2.LineTotal) 
			FROM Sales.SalesOrderDetail AS s2
			WHERE s1.ProductID = s2.ProductID)) 
			AS NUMERIC (5, 2)) AS [Percentage]
FROM Sales.SalesOrderDetail AS s1) AS T
GROUP BY T.ProductID

SELECT 
    H1.SalesOrderID
    ,H1.SalesPersonID
    ,H1.OrderDate
    ,H1.CustomerID
FROM Sales.SalesOrderHeader AS H1
WHERE H1.SalesOrderID = 
    (SELECT MAX (H2.SalesOrderID)
    FROM Sales.SalesOrderHeader AS H2
    WHERE H1.CustomerID = H2.CustomerID)
AND h1.SalesPersonID IS NOT NULL
ORDER BY H1.CustomerID

DECLARE @SalesOrderID INT = (SELECT MAX(SalesOrderID)
FROM Sales.SalesOrderHeader
WHERE CustomerID = 11000
GROUP BY CustomerID)

SELECT 
    H1.SalesOrderID
    ,H1.SalesPersonID
    ,H1.OrderDate
    ,H1.CustomerID
FROM Sales.SalesOrderHeader AS H1
WHERE H1.SalesOrderID = @SalesOrderID

--Показать товары, цена которых равна минимальной цене 
--товара из того же размера (Таблица Production.Product). 
--Показать поля [Name], ListPrice и Size.
SELECT p1.[Name]
     , p1.ListPrice
	 , p1.Size
FROM Production.Product AS p1
WHERE p1.ListPrice = 
	(
		SELECT MIN(p2.ListPrice)
		FROM Production.Product AS p2
		WHERE p2.Size = p1.Size
		AND p2.ListPrice > 0
	)
AND p1.Size IS NOT NULL

SELECT DISTINCT 
--p1.[Name]
      MIN(p1.ListPrice)
	 , p1.Size
FROM Production.Product AS p1
INNER JOIN  Production.Product AS p2
ON p1.Size = p2.Size
WHERE p1.ListPrice > 0 AND p1.Size IS NOT NULL
GROUP BY p1.Size
--, p1.[Name]
;

--Максимальная среди средних цен
SELECT TOP 1 AVG(p.ListPrice)
FROM Production.Product AS p
WHERE p.ListPrice > 0
ORDER BY 1 DESC;

--Средняя среди максимальных по цвету
 SELECT AVG(t.[Avg])
 FROM (
	SELECT MAX(p.ListPrice) AS [Avg]
	FROM Production.Product AS p
	GROUP BY p.Color) AS t;

--Имя самого молодого сотрудника
DECLARE @BirthDate DATE = 
(
	SELECT MAX(h.BirthDate)
	FROM HumanResources.Employee AS h
);

DECLARE @ID INT =
(
	SELECT h.BusinessEntityID
	FROM HumanResources.Employee AS h
	WHERE h.BirthDate = @BirthDate
);

SELECT *
FROM Person.Person
WHERE BusinessEntityID = @ID;


SELECT *
FROM Person.Person
WHERE BusinessEntityID =
	(SELECT h.BusinessEntityID
	FROM HumanResources.Employee AS h
	WHERE h.BirthDate = 
		(SELECT MAX(h.BirthDate)
	     FROM HumanResources.Employee AS h))

--Показать товары, которые принадлежат подкатегории Bikes

SELECT *
FROM Production.Product
WHERE ProductSubcategoryID = 
	(SELECT ProductCategoryID
	FROM Production.ProductCategory
	WHERE [Name] LIKE 'Bikes');

--Показать покупателей из North America
SELECT *
FROM Sales.Customer
WHERE TerritoryID IN 
	(
	SELECT TerritoryID
	FROM Sales.SalesTerritory
	WHERE [Group] = 'North America'
	);

SELECT c.CustomerID
	 , c.PersonID
	 , s.[Group]
FROM Sales.Customer AS c
INNER JOIN Sales.SalesTerritory AS s
ON c.TerritoryID = s.TerritoryID
WHERE s.[Group] = 'North America';

---

SELECT TOP 1
          COUNT(e.BusinessEntityID)
		, a.City
FROM Person.BusinessEntityAddress AS e
INNER JOIN  Person.[Address] AS a
ON a.AddressID = e.AddressID
GROUP BY a.City
ORDER BY 1 DESC
--

ALTER VIEW dbo.v PersonAddress 
AS
SELECT *
FROM Person.[Address] AS a
WHERE a.City = 'London'
WITH CHECK OPTION;


INSERT INTO dbo.vPersonAddress
VALUES (32522,'1197 Kulani Lane', 'Space 55', 'Moscow',79,98074
,0xE6100000010CEE44C4963BCA4740400DB24428845EC0
,'868501B7-4B9C-4F27-896B-342689EA5980'
,'2009-01-15 00:00:00.000')

--Вложеные запросы 
SELECT productid, productname, unitprice
FROM Production.Products
WHERE unitprice = (SELECT MIN(unitprice)
FROM Production.Products);

--(5вар 3пункт) Более трёх продуктов в одном стиле
SELECT [Name], Style, ProductLine
FROM Production.Product
WHERE Style IN (
	SELECT COUNT(ProductLine), Style
	FROM Production.Product
	WHERE Style IS NOT NULL
	GROUP BY Style
	HAVING COUNT(ProductLine) > 3 )

SELECT [Name], Style, ProductLine
FROM Production.Product
WHERE Style IS NOT NULL
GROUP BY [Name], Style, ProductLine

SELECT DISTINCT ProductLine
FROM Production.Product