-- 5.	�� ������� Person.[Address] �������� ����� (AddressLine1), ����� (City) � ID ���������������� �������� 
--		(StateProvinceID), ��� ����� �������� 'Dr.'.
SELECT AddressLine1,
		City,
		StateProvinceID
FROM [Person].[Address]
WHERE (AddressLine1 LIKE '%Dr'); 