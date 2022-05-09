-- 7.Из таблицы Production.Product показать ID товара (ProductID), его название ([Name]) и тип линейки товаров (ProductLine).
--	Неизвестные значения линейки товаров заменить на 'no'. Названия полей оставить без изменений.
SELECT ProductID,
		[Name],
		ProductLine,
		ISNULL (ProductLine, 'no') AS ProductLine
FROM Production.Product;