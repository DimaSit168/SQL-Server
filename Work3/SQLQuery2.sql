--2. Показать список людей (поля FirstName, LastName), в котором указано, есть ли у них рабочие должности 
-- из таблиц Person.Person, Person.Employee, используя LEFT OUTER JOIN.
SELECT FirstName, LastName, JobTitle
From Person.Person a
LEFT OUTER JOIN HumanResources.Employee b
ON a.BusinessEntityID = b.BusinessEntityID
--WHERE JobTitle IS NOT NULL;

----LEFT OUTER JOIN `positions` ON id_pos = position_ref
--SELECT *
--From Person.Person
--SELECT *
--From [HumanResources].[Employee]

--SELECT FirstName, LastName, JobTitle
--FROM Person.Person
