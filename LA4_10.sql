--Learning Activity 4.10: Views

--Use ¡°create_ap.sql¡± to create database.

--1. Write a CREATE VIEW statement that defines a view named InvoiceBasic that returns three columns: VendorName, InvoiceNumber, and InvoiceTotal. 
--Then, write a SELECT statement that returns all of the columns in the view, sorted by VendorName, where the first letter of the vendor name is N, O, or P.

CREATE VIEW InvoiceBasic AS
SELECT a.VendorName, b.InvoiceNumber, b.InvoiceTotal
FROM Vendors a
INNER JOIN Invoices b on a.VendorID=b.VendorID;

--SELECT * FROM InvoiceBasic;

GO

SELECT * FROM InvoiceBasic WHERE VendorName LIKE ('N%') OR VendorName LIKE ('O%') OR VendorName LIKE ('P%') ORDER BY VendorName; 
SELECT * FROM InvoiceBasic WHERE LEFT(VendorName,1) IN ('N', 'O', 'P') ORDER BY VendorName; 

GO

--2. Create a view named Top10PaidInvoices that returns three columns for each vendor: VendorName, LastInvoice (the most recent invoice date), and SumOfInvoices (the sum of the InvoiceTotal column).
--Return only the 10 vendors with the largest SumOfInvoices and include only paid invoices.
 GO

CREATE VIEW Top10PaidInvoices AS
SELECT TOP 10 a.VendorName, MAX(b.InvoiceDate) AS "LastInvoice", SUM(b.InvoiceTotal) AS "SumOfInvoices" 
FROM Vendors a
INNER JOIN Invoices b on a.VendorID=b.VendorID
WHERE b.InvoiceTotal-b.PaymentTotal-b.CreditTotal=0
GROUP BY VendorName
ORDER BY SUM(b.InvoiceTotal) DESC;

SELECT * FROM Top10PaidInvoices;

GO

--3. Create an updatable view named VendorAddress that returns the VendorID, both address columns, and the city, state, and zip code columns for each vendor. 
--Then, write a SELECT query to examine the result set where VendorID=4. 
--Next, write an UPDATE statement that changes the address so that the suite number (Ste 260) is stored in VendorAddress2 rather than in VendorAddress1. To verify the change, rerun your SELECT query.
GO

CREATE VIEW VendorAddress AS
SELECT VendorID, VendorAddress1, VendorAddress2, VendorCity, VendorState, VendorZipCode FROM Vendors;

GO

SELECT VendorID, VendorAddress1, VendorAddress2, VendorCity, VendorState, VendorZipCode FROM VendorAddress WHERE VendorID=4;
UPDATE VendorAddress SET VendorAddress1='1990 Westwood Blvd',  VendorAddress2 = 'Ste 260' WHERE VendorID=4; 
