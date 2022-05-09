-- 4.	����� ������� ��������� ProductLine �� ������� Production.Product, ��� ������������ ��� ������ 500 
-- (�� ������� ��������� ������ ����).
SELECT MAX(Weight) AS Weight, ProductLine
FROM Production.Product
WHERE ProductLine IS NOT NULL
GROUP BY ProductLine
HAVING MAX(Weight) < 500;