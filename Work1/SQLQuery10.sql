-- 10.	Из таблицы Production.ProductModelProductDescriptionCulture показать поля ProductModelID и CultureID.
--		Все значения поля CultureID, равные 'fr', заменить на NULL и вынести в отдельное поле с названием NullCultureID.
SELECT ProductModelID,
		CultureID,
		NULLIF(CultureID, 'fr') AS NullCultureID
FROM Production.ProductModelProductDescriptionCulture;