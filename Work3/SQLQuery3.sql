--3. �������� ������ ����� (���� FirstName, LastName), � ������� �������, ����� �� ��� ������ �� ������ ��� ���, 
-- �� ������ Sales.SalesPerson, Person.Person, ��������� RIGHT OUTER JOIN.
SELECT FirstName, LastName, Bonus
FROM Person.Person a
RIGHT OUTER JOIN Sales.SalesPerson b
ON a.BusinessEntityID = b.BusinessEntityID
--WHERE Bonus > 0
--GROUP BY Bonus;

--SELECT *
--FROM Sales.SalesPerson 
--, Bonus

--SELECT *
--FROM Person.Person