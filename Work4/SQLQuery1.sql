--1. �������� �����, � ����������� �������� ����� ����� � ����������� ���������� (�� ��������� ������ � �����, ������ ����).
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


--2. �������� ����� ������ ����� (��� ��������� � ������ ����)(������� Production.Product). �������� ���� [Name], [Weight].
SELECT [Name], Weight
FROM Production.Product
WHERE Weight > 0
ORDER BY Weight;

--3. �������� ������, ��� ������� ���������� ����� 2 �������, � ����� ����� (����� � ����� ���������) 
--(������� Production.Product). �������� ���� [Name], Style � Class.

SELECT [Name], Style, Class
FROM Production.Product
WHERE Style IS NOT NULL 
AND Class IS NOT NULL
ORDER BY Class;

--4. �������� ������, ���� ������� ����� ����������� (������ ����) ���� ������ ���� �� ������� (������ ���������) 
--(������� Production.Product). �������� ���� [Name], ListPrice � Size.

SELECT [Name], ListPrice, Size
FROM Production.Product
WHERE ListPrice > 0
AND Size IS NOT NULL
ORDER BY ListPrice;

--5. �������� ������, ���� ������� ������ ������� ���� � ����� ����� (������� Production.Product). 
--�������� ���� [Name], ListPrice � Color.

SELECT [Name], ListPrice, Color
FROM Production.Product
WHERE ListPrice < ANY 
	(SELECT AVG(ListPrice) 
	FROM Production.Product 
	WHERE ListPrice > 0 AND Color IS NOT NULL 
	GROUP BY Color) 
ORDER BY ListPrice DESC;