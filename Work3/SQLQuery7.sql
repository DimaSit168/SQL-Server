-- 7. Показать комбинированный список таблиц Purchasing.PurchaseOrderHeader по полям PurchaseOrderID, 
-- Freight, Purchasing.PurchaseOrderDetail по полям PurchaseOrderDetailID, UnitPrice, используя UNION.
SELECT PurchaseOrderID, Freight
FROM Purchasing.PurchaseOrderHeader
UNION
SELECT PurchaseOrderDetailID, UnitPrice
FROM Purchasing.PurchaseOrderDetail