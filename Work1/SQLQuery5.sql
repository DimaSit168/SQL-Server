-- 5.	Из таблицы Person.[Address] показать адрес (AddressLine1), город (City) и ID территориального субъекта 
--		(StateProvinceID), где адрес содержит 'Dr.'.
SELECT AddressLine1,
		City,
		StateProvinceID
FROM [Person].[Address]
WHERE (AddressLine1 LIKE '%Dr'); 