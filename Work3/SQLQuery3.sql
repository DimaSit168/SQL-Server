--3. ѕоказать список людей (пол€ FirstName, LastName), в котором указано, имеют ли они бонусы от продаж или нет, 
-- из таблиц Sales.SalesPerson, Person.Person, использу€ RIGHT OUTER JOIN.
SELECT FirstName, LastName, Bonus
FROM Person.Person a
RIGHT OUTER JOIN Sales.SalesPerson b
ON a.BusinessEntityID = b.BusinessEntityID
--WHERE Bonus > 0
--GROUP BY Bonus;

--SELECT *
--FROM Sales.SalesPerson 
--, Bonus

--SELECT *
--FROM Person.Person