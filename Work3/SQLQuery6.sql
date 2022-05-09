-- 6. �������� ������ ��������� (ProductID), ������� ����� ��������� ��������� �������� �� ������� (Quantity), 
-- �� ������� Production.ProductInventory, ��������� SELF JOIN. �������� �������� �� ������ 200.
SELECT DISTINCT ProductID, Quantity
FROM Production.ProductInventory
--INNER JOIN Production.ProductInventory
--ON a.Quantity <> b.Quantity
--INNER JOIN Product Pr
--ON Quantity = ProductID
WHERE Quantity <= 200

SELECT DISTINCT b.ProductID, b.Quantity
FROM Production.ProductInventory a
INNER JOIN Production.ProductInventory b
ON a.ProductID = b.ProductID
AND a.Quantity <> b.Quantity
WHERE b.Quantity <= 200
