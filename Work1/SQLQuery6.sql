-- 6.	�������� ���� TransactionID � TransactionType �� ������� Production.TransactionHistoryArchive,
--		��� �������� ���� TransactionType ����������� ������ ('P', 'S'). ������������ �������� IN.
SELECT TransactionID,
		TransactionType
FROM Production.TransactionHistoryArchive
WHERE TransactionType IN ('P','S');
