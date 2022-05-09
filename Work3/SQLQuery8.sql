-- 8. Показать список ProductModelID, которые содержатся в таблице Production.ProductModel, 
-- но не содержатся в таблице Production.ProductModelIllustration.
SELECT ProductModelID
FROM Production.ProductModel
EXCEPT
SELECT ProductModelID
FROM Production.ProductModelIllustration
--ORDER BY ProductModelID