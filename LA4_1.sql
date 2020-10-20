--Run the ¡°create_ap.sql¡± script to create the database.
--1.	Select all column from vendor.

SELECT * FROM Vendors;

--2.	Select id and name from vendor.

SELECT VendorID, VendorName FROM Vendors;

--3.	Return the vendor ID, date, and invoice total of all invoices.

SELECT VendorID, InvoiceDate, InvoiceTotal FROM Invoices;

--4.	Return the invoice number as ¡°Number¡± and the invoice date as ¡°Date¡± from Invoices.

SELECT InvoiceNumber AS "Number", InvoiceDate AS "Date" FROM Invoices;

--5.	Return all vendor names and IDs, with a single column for both lines of mailing address called ¡°Mailing Address¡±.

SELECT VendorID, VendorName, CONCAT(VendorAddress1, + ' ', VendorAddress2) AS "Mailing Address" FROM Vendors;

--6.	Return all vendor names and a single column for city and state called ¡°Region¡±.

SELECT VendorName, CONCAT(VendorCity, +' ', VendorState) AS "Region" FROM Vendors;

--7.	Return all distinct invoice dates from invoices.

SELECT DISTINCT InvoiceDate FROM Invoices;

--8.	Return all distinct city, state combinations from Vendors.

SELECT DISTINCT CONCAT(VendorCity, +' ', VendorState) FROM Vendors;

--9.	Return all distinct zip codes from Vendors.

SELECT DISTINCT VendorZipCode FROM Vendors;

--10.	Return all vendors ordered by last name, then first name.

SELECT * FROM Vendors ORDER BY VendorContactLName, VendorContactFName;

--11.	Return the top five most recent invoices.

SELECT TOP 5 * FROM Invoices ORDER BY InvoiceDate DESC;

--12.	Return the top 10 percent oldest invoices.

SELECT TOP 10 PERCENT * FROM Invoices ORDER BY InvoiceDate ASC;

--13.	Select the bottom ten percent of invoice line items by amount.

SELECT TOP 10 PERCENT * FROM InvoiceLineItems ORDER BY InvoiceLineItemAmount ASC;

--14.	Select the top ten percent of invoices ordered by invoicetotal.

SELECT TOP 10 PERCENT * FROM Invoices ORDER BY InvoiceTotal;

--15.	Return the vendorID column, invoice total, and amount owed. Amount owed is equal to credit + payment - total.

SELECT VendorID, InvoiceTotal, (CreditTotal+PaymentTotal-InvoiceTotal) AS "Amount Owned" FROM Invoices;

--16.	Select all invoices with a payment less than the invoice total.

SELECT * FROM Invoices WHERE PaymentTotal<InvoiceTotal;

--17.	Return all vendors who are located in a state other than CA.

SELECT VendorID, VendorName, VendorState FROM Vendors WHERE VendorState != 'CA';

--18.	Select all line items with an invoice ID greater than 50 and an amount less than 1000.

SELECT * FROM InvoiceLineItems WHERE InvoiceID>50 AND InvoiceLineItemAmount<1000;

--19.	Find all invoices with a total amount greater than or equal to 500 and a date less than January 15, 2016.

SELECT * FROM Invoices WHERE InvoiceTotal>=500 AND InvoiceDueDate<'2016-01-15';

--20.	Return all invoices with a payment total between 0 and 500.

SELECT * FROM Invoices WHERE PaymentTotal BETWEEN 0 AND 500;

--21.	Return all vendors located in one of the following states: AL, AB, FL, MS.

SELECT * FROM Vendors WHERE VendorState = 'AL' OR VendorState ='AB' OR VendorState ='FL' OR VendorState ='MS';

SELECT * FROM Vendors WHERE VendorState IN ('AL','AB','FL','MS'); 

--22.	Return all vendors with ¡®Main¡¯ in their address.

SELECT * FROM Vendors WHERE VendorAddress1 like '%Main%' OR VendorAddress2 like '%Main%';

