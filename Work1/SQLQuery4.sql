-- 4.	�������� ��� ������������ ������ ����� (Frame) ���� [Name] � ProductModelID, �� ������� Production.ProductModel.
SELECT 	[Name],
		ProductModelID
FROM Production.ProductModel
WHERE Name LIKE '%Frame';