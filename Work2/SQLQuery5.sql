-- 5.	�������� ������������ ������, ���� � ����. ������� ����� �� ���� ������ ������, ���������� �� ����������� ����.
--SELECT RANK() OVER (ORDER BY ListPrice) AS N
SELECT NTILE(5) OVER (ORDER BY ListPrice) AS N
	 , [Name]
	 , ListPrice
	 , Color
FROM Production.Product
WHERE ListPrice > 0;