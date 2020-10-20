--Learning Activity 4.4: Data Retrieval from Multiple Tables

--Download ¡°Chinook_SqlServer.sql¡± and use it to run the following queries.

--1.	For each track, return the following columns:
--o	Track Name
--o	Track Length
--o	Album Title
--o	Artist Name
--Do not include tracks without a matching album or artist.
--Order the results by album id, ascending.

SELECT a.Name AS "Track Name", a.Milliseconds AS "Track Length", b.Title AS "Album Title", c.Name AS "Artist Name" 
FROM Track a
INNER JOIN Album b ON a.AlbumId=b.AlbumId
INNER JOIN Artist c ON b.ArtistId=c.ArtistId
ORDER BY b.AlbumId;

--2.	For each track, return the following columns:
--o	Track Name
--o	Track Unit Price
--o	Media Type Name
--o	Genre Name
--Do not include tracks without a matching genre type or media type. Order by genre name alphabetically

SELECT a.Name AS "Track Name", a.UnitPrice AS "Track Unit Price", b.Name AS "Media Type Name", c.Name AS "Genre Name" 
FROM Track a
INNER JOIN MediaType b ON a.MediaTypeId=b.MediaTypeId
INNER JOIN Genre c ON a.GenreId=c.GenreId
ORDER BY c.Name;

--3. For each track that is not in playlist, return the following
--Track name
--Size in bytes

SELECT Name AS "Track Name", Bytes AS "Size in bytes" FROM Track
WHERE TrackID NOT IN
(SELECT TrackID FROM PlaylistTrack a
INNER JOIN Playlist b ON a.PlaylistId=b.PlaylistId); 

--4. For each employee who does not support a customer, return the following
--First name
--Last name

SELECT FirstName AS "First Name", LastName AS "Last Name" FROM Employee
EXCEPT
SELECT FirstName, LastName FROM Customer;

--5. Return the following columns
--Last name
--First name
--Phone number
--Return a row for each customer and a row for each employee in a single table

SELECT LastName AS "Last Name", FirstName AS "First Name", Phone AS "Phone Number" FROM Customer
UNION
SELECT LastName, FirstName, Phone FROM Employee;

--6. Return the following columns
--Name: Name should contain a composer name or an artist name.
--Return a row for each artist and a row for each track that has a composer in a single table.

SELECT Name FROM Artist
UNION
SELECT Composer FROM Track;