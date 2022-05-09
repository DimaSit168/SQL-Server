-- 5. �������� ������ �������� (Size), ������� ����� ��������� ������ ��������� (Color), 
-- �� ������� Production.Product, ��������� SELF JOIN.
SELECT DISTINCT * --e.Size 
--,e.Color, e.[Name]
FROM Production.Product AS e
INNER JOIN Production.Product AS m
ON e.Size = m.Size
AND e.Color <> m.Color

SELECT DISTINCT e.Size, e.Color, e.[Name]
FROM Production.Product AS e
INNER JOIN Production.Product AS m
ON e.Size = m.Size
AND  e.Color <> m.Color
ORDER BY e.Size