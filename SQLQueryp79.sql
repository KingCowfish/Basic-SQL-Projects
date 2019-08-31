CREATE DATABASE db_Library

USE db_Library
GO

CREATE TABLE Library_Branch (
	BranchID INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	BranchName NVARCHAR(50) NOT NULL,
	LibraryAddress VARCHAR(50) NOT NULL
);

CREATE TABLE Publisher (
	PublisherName VARCHAR(50) PRIMARY KEY NOT NULL,
	PUblisherAddress VARCHAR(50) NOT NULL,
	Phone INT NOT NULL
);

CREATE TABLE Borrower (
	CardNo INT PRIMARY KEY NOT NULL IDENTITY (473829,1),
	BorrowerName VARCHAR(50) NOT NULL,
	BorrowerAddress VARCHAR(50) NOT NULL,
	Phone INT NOT NULL
);

CREATE TABLE Books (
	BookID INT PRIMARY KEY NOT NULL IDENTITY(1000,1),
	Title VARCHAR(50) NOT NULL,
	PublisherName VARCHAR(50) NOT NULL CONSTRAINT Fk_PublisherName FOREIGN KEY REFERENCES Publisher(PublisherName) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE Book_Loans (
	BookID INT NOT NULL CONSTRAINT Fk_BookID FOREIGN KEY REFERENCES Books(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
	BranchID INT NOT NULL CONSTRAINT FK_BranchID FOREIGN KEY REFERENCES Library_Branch(BranchID) ON UPDATE CASCADE ON DELETE CASCADE,
	CardNo INT NOT NULL CONSTRAINT Fk_CardNo FOREIGN KEY REFERENCES Borrower(CardNo) ON UPDATE CASCADE ON DELETE CASCADE,
	DateOut DATE NOT NULL,
	DateDue DATE NOT NULL
);

CREATE TABLE Book_Copies (
	BookID INT NOT NULL CONSTRAINT Fk_BookID2 FOREIGN KEY REFERENCES Books(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
	BranchID INT NOT NULL CONSTRAINT FK_BranchID2 FOREIGN KEY REFERENCES Library_Branch(BranchID) ON UPDATE CASCADE ON DELETE CASCADE,
	NumberOfCopies INT NOT NULL
);

CREATE TABLE Book_Authors (
	BookID INT NOT NULL CONSTRAINT Fk_BookID3 FOREIGN KEY REFERENCES Books(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
	AuthorName VARCHAR(50) NOT NULL
);

INSERT Library_Branch
	(BranchName, LibraryAddress)
	VALUES
	('Sharpstown', 'Houston, TX'),
	('Central', 'Houston, TX'),
	('Bracewell', 'Houston, TX'),
	('Dixon', 'Houston, TX')
;

INSERT Publisher
	(PublisherName, PUblisherAddress, Phone)
	VALUES
	('West 26th St Press', 'OH', -1782),
	('Scribner', 'NY', -1783),
	('Gallery Books', 'OR', -1784),
	('Riverhead Books', 'CA', -1785),
	('Crown', 'CA', -1786),
	('St.Martin''s Press', 'MO', -1787),
	('Dutton Books', 'NB', -1788),
	('Doubleday', 'NY', -1789),
	('Ballantine Books', 'NJ', -1761),
	('Little, Brown and Company', 'FL', -1762),
	('Lake Union Publish', 'FL', -1763),
	('Scholastic Press', 'WA', -1764),
	('Katherine Tegan Books', 'MI', -1765),
	('Viking', 'WA', -1766),
	('William Morrow & Company', 'PA', -1767),
	('Delacorte Press', 'PA', -1768),
	('Knopf Books', 'CT', -17619)
;

INSERT Borrower
	(BorrowerName, BorrowerAddress, Phone)
	VALUES
	('Eddie Vedder', 'WA', -8759),
	('Chris Cornell', 'WA', -7801),
	('Kurt Cobain', 'WA', -9044),
	('Alanis Morrisette', 'CA', -9045),
	('Fiona Apple', 'CT', -6555),
	('Janis Joplin,', 'GA', -9091),
	('Layne Staley', 'WA', -4552),
	('Lorenna McKennit', 'NY', -8231)
;

INSERT Books 
	(Title, PublisherName)
	VALUES
	('The Lost Tribe', 'West 26th St Press'),
	('It', 'Scribner'),
	('Pet Cemetery', 'Gallery Books'),
	('The Girl On The Train', 'Riverhead Books'),
	('Gone Girl', 'Crown'),
	('The NIghtingale', 'St.Martin''s Press'),
	('The Fault In Our Stars', 'Dutton Books'),
	('Fifty Shades of Grey', 'Doubleday'),
	('The Martian', 'Crown'),
	('All The Light We Cannot See', 'Scribner'),
	('Unbroken', 'Ballantine Books'),
	('The Goldfinch', 'Little, Brown and Company'),
	('Beneath A Scarlet Sky', 'Lake Union Publish'),
	('The Hunger Games', 'Scholastic Press'),
	('Divergent', 'Katherine Tegan Books'),
	('Inferno', 'Doubleday'),
	('The Boys In The Boat', 'Viking'),
	('Orphan Train', 'William Morrow & Company'),
	('Outlander', 'Delacorte Press'),
	('The Book Thief', 'Knopf Books')
;

INSERT Book_Loans
	(BookID, BranchID, CardNo, DateOut, DateDue)
	VALUES
	(1001, 1, 473830, '2019-08-30', '2019-09-30'),
	(1001, 1, 473831, '2019-08-30', '2019-09-30'),
	(1001, 3, 473832, '2019-08-30', '2019-09-30'),
	(1001, 3, 473835, '2019-08-30', '2019-09-30'),
	(1002, 2, 473830, '2019-08-30', '2019-09-30'),
	(1002, 2, 473836, '2019-08-30', '2019-09-30'),
	(1002, 4, 473834, '2019-08-30', '2019-09-30'),
	(1002, 4, 473835, '2019-08-30', '2019-09-30'),
	(1003, 1, 473830, '2019-08-30', '2019-09-30'),
	(1003, 1, 473835, '2019-08-30', '2019-09-30'),
	(1003, 3, 473832, '2019-08-30', '2019-09-30'),
	(1003, 1, 473836, '2019-08-30', '2019-09-30'),
	(1004, 2, 473829, '2019-08-30', '2019-09-30'),
	(1004, 2, 473832, '2019-08-30', '2019-09-30'),
	(1004, 4, 473833, '2019-08-30', '2019-09-30'),
	(1004, 4, 473836, '2019-08-30', '2019-09-30'),
	(1005, 1, 473830, '2019-08-30', '2019-09-30'),
	(1005, 1, 473835, '2019-08-30', '2019-09-30'),
	(1006, 2, 473835, '2019-08-30', '2019-09-30'),
	(1006, 2, 473836, '2019-08-30', '2019-09-30'),
	(1006, 4, 473831, '2019-08-30', '2019-09-30'),
	(1006, 4, 473833, '2019-08-30', '2019-09-30'),
	(1007, 1, 473830, '2019-08-30', '2019-09-30'),
	(1007, 1, 473831, '2019-08-30', '2019-09-30'),
	(1007, 1, 473836, '2019-08-30', '2019-09-30'),
	(1007, 3, 473835, '2019-08-30', '2019-09-30'),
	(1008, 2, 473829, '2019-08-30', '2019-09-30'),
	(1008, 4, 473833, '2019-08-30', '2019-09-30'),
	(1008, 4, 473836, '2019-08-30', '2019-09-30'),
	(1009, 1, 473830, '2019-08-30', '2019-09-30'),
	(1009, 1, 473836, '2019-08-30', '2019-09-30'),
	(1009, 3, 473832, '2019-08-30', '2019-09-30'),
	(1010, 2, 473829, '2019-08-30', '2019-09-30'),
	(1010, 4, 473834, '2019-08-30', '2019-09-30'),
	(1010, 4, 473836, '2019-08-30', '2019-09-30'),
	(1011, 1, 473832, '2019-08-30', '2019-09-30'),
	(1011, 3, 473835, '2019-08-30', '2019-09-30'),
	(1012, 2, 473832, '2019-08-30', '2019-09-30'),
	(1012, 4, 473836, '2019-08-30', '2019-09-30'),
	(1013, 1, 473833, '2019-08-30', '2019-09-30'),
	(1013, 1, 473834, '2019-08-30', '2019-09-30'),
	(1013, 3, 473835, '2019-08-30', '2019-09-30'),
	(1013, 3, 473836, '2019-08-30', '2019-09-30'),
	(1014, 2, 473831, '2019-08-30', '2019-09-30'),
	(1014, 2, 473835, '2019-08-30', '2019-09-30'),
	(1014, 4, 473831, '2019-08-30', '2019-09-30'),
	(1014, 4, 473832, '2019-08-30', '2019-09-30'),
	(1015, 1, 473836,'2019-08-30', '2019-09-30'),
	(1015, 1, 473835, '2019-08-30', '2019-09-30'),
	(1015, 3, 473836, '2019-08-30', '2019-09-30'),
	(1016, 2, 473832, '2019-08-30', '2019-09-30'),
	(1016, 4, 473835, '2019-08-30', '2019-09-30'),
	(1017, 1, 473829, '2019-08-30', '2019-09-30'),
	(1017, 1, 473836, '2019-08-30', '2019-09-30'),
	(1017, 3, 473836, '2019-08-30', '2019-09-30'),
	(1018, 2, 473836, '2019-08-30', '2019-09-30'),
	(1018, 4, 473830, '2019-08-30', '2019-09-30'),
	(1018, 4, 473834, '2019-08-30', '2019-09-30'),
	(1019, 1, 473829, '2019-08-30', '2019-09-30'),
	(1019, 1, 473835, '2019-08-30', '2019-09-30'),
	(1019, 3, 473832, '2019-08-30', '2019-09-30'),
	(1019, 3, 473835, '2019-08-30', '2019-09-30'),
	(1020, 4, 473836, '2019-08-30', '2019-09-30')
;

INSERT Book_Copies 
	(BookID, BranchID, NumberOfCopies)
	VALUES
	(1001, 1, 2),
	(1001, 3, 2),
	(1002, 2, 2),
	(1002, 4, 2),
	(1003, 2, 3),
	(1003, 3, 2),
	(1004, 1, 2),
	(1004, 4, 2),
	(1005, 1, 3),
	(1005, 3, 2),
	(1006, 2, 2),
	(1006, 4, 2),
	(1007, 1, 3),
	(1007, 3, 2),
	(1008, 2, 2),
	(1008, 4, 2),
	(1009, 1, 2),
	(1009, 3, 2),
	(1010, 2, 2),
	(1010, 4, 2),
	(1011, 1, 2),
	(1011, 3, 2),
	(1012, 2, 2),
	(1013, 1, 2),
	(1013, 3, 2),
	(1014, 2, 2),
	(1014, 4, 2),
	(1015, 1, 2),
	(1015, 3, 2),
	(1016, 2, 2),
	(1016, 4, 2),
	(1017, 1, 2),
	(1017, 3, 2),
	(1018, 2, 2),
	(1018, 4, 2),
	(1019, 1, 2),
	(1019, 3, 2),
	(1020, 2, 4),
	(1020, 4, 2)
;

INSERT Book_Authors
	(BookID, AuthorName)
	VALUES
	(1001, 'Mark Lee'),
	(1002, 'Stephen King'),
	(1003, 'Stephen King'),
	(1004, 'Paula Hawkins'),
	(1005, 'Gillian Flynn'),
	(1006, 'Kristin Hannah'),
	(1007, 'John Green'),
	(1008, 'E L James'),
	(1009, 'Andy Weir'),
	(1010, 'Anthony Doerr'),
	(1011, 'Laura Hillenbrand'),
	(1012, 'Donna Tarrt'),
	(1013, 'Mark Sullivan'),
	(1014, 'Suzanne Collins'),
	(1015, 'Veronica Roth'),
	(1016, 'Dan Brown'),
	(1017, 'Daniel James Brown'),
	(1018, 'Christina Baker Kline'),
	(1019, 'Diana Gabaldon'),
	(1020, 'Markus Zusak')
;

USE db_Library
GO
CREATE PROC LTribeCopiesStown
AS
SELECT NumberOfCopies
FROM Book_Copies
INNER JOIN Books ON Book_Copies.BookID = Books.BookID
INNER JOIN Library_Branch ON Book_Copies.BranchID = Library_Branch.BranchID
WHERE Title = 'The Lost Tribe' AND BranchName = 'Sharpstown';
GO

USE db_Library
GO
CREATE PROC LTribeCopiesBranch
AS
SELECT BranchName, NumberOfCopies 
FROM Book_Copies
INNER JOIN Books ON Book_Copies.BookID = Books.BookID
INNER JOIN Library_Branch ON Book_Copies.BranchID = Library_Branch.BranchID
WHERE Title = 'The Lost Tribe';
GO

USE db_Library
GO
CREATE PROC NoChecked
AS
SELECT BorrowerName 
FROM Borrower
INNER JOIN Book_Loans On Book_Loans.CardNo = Borrower.CardNo
WHERE Borrower.CardNO NOT IN (Book_Loans.CardNo);
GO

USE db_Library
GO
CREATE PROC DueDate
AS
SELECT Books.Title, BorrowerName, Borrower.BorrowerAddress
FROM Borrower
INNER JOIN Book_Loans ON Borrower.CardNo = Book_Loans.CardNo
INNER JOIN Books ON Books.BookID = Book_Loans.BookID
INNER JOIN Library_Branch ON Library_Branch.BranchID = Book_Loans.BranchID
WHERE BranchName = 'Sharpstown' AND DateDue >=DATEADD(day, DATEDIFF(day,0,GETDATE()),0) 
AND DateDue < DATEADD(day, DATEDIFF(day,0,GETDATE())+1,0);
GO

USE db_Library
GO
CREATE PROC TotalCheckedOut
AS
SELECT lb.BranchName, COUNT (BookID) AS 'Total_Books_Checked_Out'
FROM Book_Loans
INNER JOIN Library_Branch lb ON lb.BranchID = Book_Loans.BranchID
GROUP BY BranchName;
GO

USE db_Library
GO
CREATE PROC BigBorrowers
AS
SELECT BorrowerName, BorrowerAddress, COUNT(bl.CardNo) AS 'Total_Books_Checked_Out'
FROM Book_Loans bl
INNER JOIN Borrower ON Borrower.CardNo = bl.CardNo
GROUP BY BorrowerName, BorrowerAddress
HAVING COUNT(bl.CardNo) >= 5;
GO

USE db_Library
GO
CREATE PROC KingAtCentral
AS
SELECT b1.Title, bc.NumberOfCopies
FROM Books b1
INNER JOIN Book_Copies bc ON bc.BookID = b1.BookID
INNER JOIN Book_Authors ba ON b1.BookID = ba.BookID
INNER JOIN  Library_Branch lb ON bc.BranchID = lb.BranchID
WHERE AuthorName = 'Stephen King' AND BranchName = 'Central';
GO

