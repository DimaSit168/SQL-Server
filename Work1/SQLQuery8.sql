-- 8.	�������� ���� ProductID, [Name] �� ������� Production.Product � ����������� ������� COALESCE(). �������� ���� 
--		Measurement, ���, �����, ���� �������� � ���� Class ��������, �� �������� ���, � �����, �������� �������� 
--		� ���� Color. ���� � � ���� Color �������� ����������, �� ������� �������� 'UNKNOWN'.
SELECT [ProductID], [Name], [Class], [Color],
--		COALESCE ([ProductID], [Name]) AS Measurement
		COALESCE (Class, Color, 'UNKNOWN') AS Measurement
--		CAST ([Class] AS VARCHAR(10)), 'UNKNOWN') AS Measurement	
--		NULLIF (Class, Color) AS Measurement
FROM [Production].[Product];