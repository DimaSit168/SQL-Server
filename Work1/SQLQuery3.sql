-- 3.	�������� ���� (WorkOrderID, ProductID, ActualCost) �� ������� Production.WorkOrderRouting, 
--		��� �������, ��� ���������� ���� ��������� � ��������� ����� $50 � $100. ������������ �������� BETWEEN.
SELECT WorkOrderID,
		ProductID,
		ActualCost
FROM Production.WorkOrderRouting
WHERE ActualCost 
BETWEEN 50 AND 100;