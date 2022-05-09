-- 2.	Ќайти все номера, которые начинаютс€ c 819 из таблицы Person.PersonPhone
SELECT COUNT(PhoneNumber)
--SELECT PhoneNumber
FROM Person.PersonPhone
WHERE PhoneNumber LIKE '819%';

