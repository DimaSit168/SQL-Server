-- 3.	�������� ������� ���� ������ � ������ ������� ��������� ProductLine �� ������� Production.Product 
-- (�� ������� ��������� ������ ����).
SELECT ProductLine, AVG(StandardCost) AS StandardCost	--�������
--	,COUNT(StandardCost) AS id			--����������
FROM Production.Product
WHERE ProductLine IS NOT NULL
GROUP BY ProductLine;