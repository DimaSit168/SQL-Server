-- 7. �������� ��������������� ������ ������ Purchasing.PurchaseOrderHeader �� ����� PurchaseOrderID, 
-- Freight, Purchasing.PurchaseOrderDetail �� ����� PurchaseOrderDetailID, UnitPrice, ��������� UNION.
SELECT PurchaseOrderID, Freight
FROM Purchasing.PurchaseOrderHeader
UNION
SELECT PurchaseOrderDetailID, UnitPrice
FROM Purchasing.PurchaseOrderDetail