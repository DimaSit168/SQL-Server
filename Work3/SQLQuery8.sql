-- 8. �������� ������ ProductModelID, ������� ���������� � ������� Production.ProductModel, 
-- �� �� ���������� � ������� Production.ProductModelIllustration.
SELECT ProductModelID
FROM Production.ProductModel
EXCEPT
SELECT ProductModelID
FROM Production.ProductModelIllustration
--ORDER BY ProductModelID