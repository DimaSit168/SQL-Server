-- 7.�� ������� Production.Product �������� ID ������ (ProductID), ��� �������� ([Name]) � ��� ������� ������� (ProductLine).
--	����������� �������� ������� ������� �������� �� 'no'. �������� ����� �������� ��� ���������.
SELECT ProductID,
		[Name],
		ProductLine,
		ISNULL (ProductLine, 'no') AS ProductLine
FROM Production.Product;