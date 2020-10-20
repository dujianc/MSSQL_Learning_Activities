---Learning Activity 4.7: Summary and SubQueries

--Use ¡°create_ap.sql¡± to create database.

--1.	Write a SELECT statement that returns two columns from the Invoices table: VendorID and PaymentSum, where PaymentSum is the sum of the PaymentTotal column. Group the result set by VendorID.

SELECT VendorID, SUM(PaymentTotal) AS "PaymentSum" FROM Invoices GROUP BY VendorID;

--2.	Write a SELECT statement that returns two columns: VendorName and PaymentSum, where PaymentSum is the sum of the PaymentTotal column. 
--Group the result set by VendorName. Return only 10 rows, corresponding to the 10 vendors who¡¯ve been paid the most.
--Hint: Use the TOP clause and join Vendors to Invoices.

SELECT TOP 10 a.VendorName, SUM(b.PaymentTotal) AS "PaymentSum" 
FROM Vendors a
INNER JOIN Invoices b ON a.VendorID=b.VendorID
GROUP BY VendorName
ORDER BY PaymentSum DESC;

--3.	Write a SELECT statement that returns three columns: VendorName, InvoiceCount, and InvoiceSum. 
--InvoiceCount is the count of the number of invoices, and InvoiceSum is the sum of the InvoiceTotal column. 
--Group the result set by vendor. Sort the result set so that the vendor with the highest number of invoices appears first.

SELECT a.VendorName, COUNT(*) AS InvoiceCount, SUM(b.InvoiceTotal) AS "InvoiceSum"   
FROM Vendors a
INNER JOIN Invoices b ON a.VendorID=b.VendorID
GROUP BY VendorName
ORDER BY InvoiceCount DESC;

--4.	Write a SELECT statement that answers this question: Which vendors are being paid from more than one account? 
--Return two columns: the vendor name and the total number of accounts that apply to that vendor¡¯s invoices.
--Hint: Use the DISTINCT keyword to count InvoiceLineItems.AccountN

SELECT a.VendorName, COUNT(DISTINCT c.AccountNo) AS "AccountCount"    
FROM Vendors a
INNER JOIN Invoices b ON a.VendorID=b.VendorID
INNER JOIN InvoiceLineItems c ON b.InvoiceID=c.InvoiceID
GROUP BY VendorName
ORDER BY AccountCount DESC;

--5.	Write a SELECT statement that returns six columns:
--VendorID From the Invoices table
--InvoiceDate From the Invoices table
--InvoiceTotal From the Invoices table
--VendorTotal: The sum of the invoice totals for each vendor
--VendorCount: The count of invoices for each vendor
--VendorAvg: The average of the invoice totals for each vendor
--The result set should include the individual invoices for each

SELECT a.VendorID, a.InvoiceDate, a.InvoiceTotal, SUM(b.InvoiceTotal) AS "VendorTotal",
COUNT(b.InvoiceID) AS "VendorCount", AVG(b.InvoiceTotal) AS "VendorAvg"
FROM Invoices a
INNER JOIN Invoices b ON a.VendorID =b.VendorID
GROUP BY a.VendorID, a.InvoiceDate, a.InvoiceTotal;

--6.	Write a SELECT statement that answers this question: Which invoices have a PaymentTotal that¡¯s greater than the average PaymentTotal for all paid invoices? 
--Return the InvoiceNumber and InvoiceTotal for each invoice.

SELECT InvoiceNumber, InvoiceTotal 
FROM Invoices
WHERE PaymentTotal>(SELECT AVG(PaymentTotal) FROM Invoices) 
AND InvoiceTotal-PaymentTotal-CreditTotal=0;
