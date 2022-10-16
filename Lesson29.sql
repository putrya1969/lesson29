--Create normalized tables for the library domain. it should include:

--books
--authors
--count of each book
--customers
--history which book was taken by whom and when

CREATE DATABASE Library
GO

USE Library
GO

CREATE TABLE Authors
(
	Id INT IDENTITY PRIMARY KEY,
	Name NVARCHAR(200) NOT NULL,
)

CREATE TABLE Books
(
	Id INT IDENTITY PRIMARY KEY,
	Name NVARCHAR(100) NOT NULL,
	AuthorId INT FOREIGN KEY REFERENCES Authors(Id) NOT NULL,
	--Quantity INT NOT NULL DEFAULT 0
)

CREATE TABLE BooksQuantity
(
	Id INT IDENTITY PRIMARY KEY,
	BookId INT FOREIGN KEY REFERENCES Books(Id) NOT NULL,
	Quantity INT NOT NULL DEFAULT 0
)

CREATE TABLE Customers
(
	Id INT IDENTITY PRIMARY KEY,
	Name NVARCHAR(100) NOT NULL,
	Phone NVARCHAR(15) DEFAULT '+000-000-00-00'
)

CREATE TABLE History
(
	Id INT IDENTITY PRIMARY KEY,
	BookId INT FOREIGN KEY REFERENCES Books(Id) NOT NULL,
	CustomerId INT FOREIGN KEY REFERENCES Customers(Id) NOT NULL,
	StartDate DATE NOT NULL,
	EndDate DATE 
)

ALTER TABLE History
ALTER COLUMN EndDate DATE 

INSERT INTO Authors (Name)
VALUES ('Suzanne Collins'),
('Harper Lee'),
('Jane Austen'),
('Markus Zusak'),
('George Orwell'),
('C.S. Lewis'),
('Margaret Mitchell'),
('John Green'),
('Shel Silverstein'),
('Oscar Wilde'),
('Lewis Carroll'),
('Charlotte Bront'),
('Ray Bradbury'),
('Veronica Roth'),
('William Shakespeare'),
('Paulo Coelho'),
('Fyodor Dostoyevsky'),
('Stephen Chbosky'),
('F. Scott Fitzgerald, Francis Scott Fitzgerald('),
('Cassandra Clare')


INSERT INTO Books (Name, AuthorId)
VALUES ('The Hunger Games',1),
('To Kill a Mockingbird', 2),
('Pride and Prejudice',3),
('The Book Thief',4),
('Animal Farm',5),
('The Chronicles of Narnia',6),
('Gone with the Wind',7),
('The Fault in Our Stars',8),
('The Giving Tree',9),
('The Picture of Dorian Gray',10),
('Alices Adventures in Wonderland & Through the Looking-Glass',11),
('Jane Eyre',12),
('Fahrenheit 451',13),
('Divergent',14),
('Romeo and Juliet',15),
('The Alchemist',16),
('Crime and Punishment',17),
('The Perks of Being a Wallflower',18),
('The Great Gatsby',19),
('City of Bones',20)

INSERT INTO BooksQuantity(BookId, Quantity)
VALUES (1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1)

INSERT INTO Customers (Name)
VALUES ('Jeeny'),
('Ron'),
('John'),
('Teodor'),
('Mike'),
('Suize')

SELECT b.Name as 'Book title', a.Name as 'Author Name', bq.Quantity as Quantity FROM Books b
LEFT JOIN Authors a ON b.AuthorId = a.Id
LEFT JOIN BooksQuantity bq ON b.Id = bq.BookId
--ISSUED BOOKs
INSERT INTO History (BookId, CustomerId, StartDate)
VALUES (3, 1, GETDATE()),
(15, 2, GETDATE()),
(7, 3, GETDATE()),
(11, 4, GETDATE()),
(18, 5, GETDATE())
--GET BOOKS HISTORY
SELECT b.Name as 'Book title', a.Name as 'Author Name', h.StartDate as 'Issued', h.EndDate as 'Returned' FROM History h
LEFT JOIN Books b ON h.BookId = b.Id
LEFT JOIN Authors a ON b.AuthorId = a.Id
--checked
