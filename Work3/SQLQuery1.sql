-- 1.	�������� �������� ������� ������� � �������� ������� (���� Name) �� ������ Production.Product, Production.ProductionModel.
SELECT a.[Name] AS NameModel, b.[Name] AS NameProduct
FROM Production.ProductModel a
INNER JOIN Production.Product b
--ON a.[Name] <> b.[Name]
ON a.ProductModelID = b.ProductModelID
--ORDER BY b.[Name];

--Select *
----FROM Production.ProductModel
--FROM Production.Product