--Learning Activity 4.9: Insert, Delete and Update Data

--Use ¡°create_ap.sql¡± to create database.

--1.	Write SELECT INTO statements to create two test tables named VendorCopy and InvoiceCopy that are complete copies of the Vendors and Invoices tables. 
--If VendorCopy and InvoiceCopy already exist, first code two DROP TABLE statements to delete them.

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[VendorCopy]') AND TYPE IN (N'U')) DROP TABLE [dbo].[VendorCopy];
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[InvoiceCopy]') AND TYPE IN (N'U')) DROP TABLE [dbo].[InvoiceCopy];
SELECT * INTO VendorCopy FROM Vendors; 
SELECT * INTO InvoiceCopy FROM Invoices; 

--2.	Write an INSERT statement that adds a row to the InvoiceCopy table with the following values:
--o	VendorID: 32
--o	InvoiceTotal: $434.58
--o	TermsID: 2
--o	InvoiceNumber: AX-014-027
--o	PaymentTotal: $0.00
--o	InvoiceDueDate: 07/8/2016
--o	InvoiceDate: 6/21/2016
--o	CreditTotal: $0.00
--o	PaymentDate: null

INSERT INTO InvoiceCopy(VendorID, InvoiceTotal, TermsID, InvoiceNumber, PaymentTotal, InvoiceDueDate, InvoiceDate, CreditTotal, PaymentDate)
VALUES (32, $434.58, 2, 'AX-014-027', $0.00, '07/8/2016', '6/21/2016', $0.00, null); 

--3.	Write an UPDATE statement that modifies the VendorCopy table. Change the default account number to 403 for each vendor that has a default account number of 400.

UPDATE VendorCopy SET DefaultAccountNo = 403 WHERE DefaultAccountNo = 400;

--4.	Write an UPDATE statement that modifies the InvoiceCopy table. 
--Change the PaymentDate to today¡¯s date and the PaymentTotal to the balance due for each invoice with a balance due. 
--Set today¡¯s date with a literal date string, or use the GETDATE() function.

UPDATE InvoiceCopy SET PaymentDate = (SELECT GETDATE()), PaymentTotal= InvoiceTotal-PaymentTotal-CreditTotal WHERE InvoiceTotal-PaymentTotal-CreditTotal>0;

--5.	Write a DELETE statement that deletes all vendors in the state of Minnesota from the VendorCopy table.

DELETE FROM VendorCopy WHERE VendorState ='MN';

--6.	Write a DELETE statement for the VendorCopy table. Delete the vendors that are located in states from which no vendor has ever sent an invoice.

DELETE VendorCopy WHERE VendorState NOT IN (SELECT DISTINCT VendorState FROM VendorCopy JOIN InvoiceCopy ON VendorCopy.VendorID=InvoiceCopy.VendorID);

--7.	Hint: Use a subquery coded with ¡°SELECT DISTINCT VendorState¡± introduced with the NOT IN operator.
