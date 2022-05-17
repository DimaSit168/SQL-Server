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


--2. �������� ����� ������ ����� (��� ��������� � ������ ����)(������� Production.Product). �������� ���� [Name], [Weight].
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

--3. �������� ������, ��� ������� ���������� ����� 2 �������, � ����� ����� (����� � ����� ���������) 
--(������� Production.Product). �������� ���� [Name], Style � Class.

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

--4. �������� ������, ���� ������� ����� ����������� (������ ����) ���� ������ ���� �� ������� (������ ���������) 
--(������� Production.Product). �������� ���� [Name], ListPrice � Size.

SELECT p1.[Name]
	,p1.ListPrice
	,p1.Size -- ������� ������� ������
FROM Production.Product AS p1
WHERE
	-- p1.Style = 'M' AND ������ ���������� ��� �����
	p1.Size IS NOT NULL AND -- � ��������� ���������� ��� ����� �� ��, ��� �� ��������
	p1.ListPrice = (
		SELECT MIN(p2.ListPrice)
		FROM Production.Product AS p2
		WHERE p1.Size = p2.Size --������� �������
		-- p2.Style IS NOT NULL ������ �������
		--GROUP BY p2.Style � ������ �����������
	)
ORDER BY p1.Size; --��������� ��� �������� �������

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