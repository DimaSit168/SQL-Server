SELECT p.FirstName ,
		p.MiddleName ,
		p.LastName ,
		DATEDIFF(YEAR,e.BirthDate,GETDATE()) AS Age 
FROM Person.Person AS p 
INNER JOIN HumanResources.Employee AS e 
ON p.BusinessEntityID = e.BusinessEntityID 
WHERE e.BirthDate = ( 
		SELECT MAX(BirthDate) 
		FROM HumanResources.Employee );

SELECT p.FirstName ,
		p.MiddleName , 
		p.LastName ,
		e.BirthDate
FROM Person.Person AS p 
INNER JOIN HumanResources.Employee AS e
ON p.BusinessEntityID = e.BusinessEntityID 

SELECT	p1.[Name] ,
		p1.ListPrice ,
		p1.Style -- ������� ������� ����� 
FROM Production.Product AS p1 
WHERE 
-- p1.Style = 'M' AND ������ ���������� ��� ����� 
p1.Style IS NOT NULL AND -- � ��������� ���������� ��� ����� �� ��, ��� �� �������� 
 p1.ListPrice = (
	SELECT MAX(p2.ListPrice) 
	FROM Production.Product AS p2 
	WHERE p1.Style = p2.Style )-- ������� ������� 
-- p2.Style IS NOT NULL ������ ������� 
-- GROUP BY p2.Style � ������ �����������

SELECT *
FROM Production.Product
WHERE Style IS NOT NULL

SELECT SalesOrderID, SUM(LineTotal) AS SubTotal
FROM Sales.SalesOrderDetail
GROUP BY SalesOrderID
ORDER BY SalesOrderID;