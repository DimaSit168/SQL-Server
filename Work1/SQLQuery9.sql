-- 9.	Из таблицы Purchasing.ShipMethod показать идентификационный номер метода доставки товаров (ShipMethodID) и 
--		название транспортной компании ([Name]). Отсортировать все строки в алфавитном порядке относительно поля [Name].
SELECT ShipMethodID,
		[Name]
FROM Purchasing.ShipMethod
ORDER BY [Name]; --СОРТИРОВКА