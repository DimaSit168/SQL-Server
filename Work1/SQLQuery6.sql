-- 6.	ѕоказать пол€ TransactionID и TransactionType из таблицы Production.TransactionHistoryArchive,
--		где значени€ пол€ TransactionType принадлежат списку ('P', 'S'). »спользовать оператор IN.
SELECT TransactionID,
		TransactionType
FROM Production.TransactionHistoryArchive
WHERE TransactionType IN ('P','S');
