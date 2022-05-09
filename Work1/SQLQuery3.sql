-- 3.	ѕоказать пол€ (WorkOrderID, ProductID, ActualCost) из таблицы Production.WorkOrderRouting, 
--		при условии, что актуальна€ цена находитс€ в диапазоне между $50 и $100. »спользовать оператор BETWEEN.
SELECT WorkOrderID,
		ProductID,
		ActualCost
FROM Production.WorkOrderRouting
WHERE ActualCost 
BETWEEN 50 AND 100;