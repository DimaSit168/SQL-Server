-- 10.	�� ������� Production.ProductModelProductDescriptionCulture �������� ���� ProductModelID � CultureID.
--		��� �������� ���� CultureID, ������ 'fr', �������� �� NULL � ������� � ��������� ���� � ��������� NullCultureID.
SELECT ProductModelID,
		CultureID,
		NULLIF(CultureID, 'fr') AS NullCultureID
FROM Production.ProductModelProductDescriptionCulture;