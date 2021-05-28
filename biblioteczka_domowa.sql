DROP DATABASE IF EXISTS  Biblioteczka_domowa;
CREATE DATABASE Biblioteczka_domowa;

GO
USE Biblioteczka_domowa;
GO
/*   tworzymy tabele Gatunek   */

CREATE TABLE Gatunek
(id_gatunku INT IDENTITY PRIMARY KEY,
nazwa_gatunku VARCHAR(50) UNIQUE 
);

/*  tworzymy tabele Wydawnictwo  */
GO
CREATE TABLE Wydawnictwo
(
id_wydawnictwa INT IDENTITY PRIMARY KEY,
nazwa_wydawnictwa VARCHAR(50) UNIQUE
);

/*  tworzymy tabele Autor  */
GO
CREATE TABLE Autor
(
Id_autora INT IDENTITY PRIMARY KEY,
imie_autora VARCHAR(20) NOT NULL,
nazwisko_autora VARCHAR (50) NOT NULL,
CONSTRAINT UQ_AUTOR_IMIE_NAZWISKO UNIQUE (imie_autora, nazwisko_autora)

);

/*  tworzymy tabele Ksiazki  */
GO
CREATE TABLE Ksiazki
( 
id_ksiazki INT IDENTITY PRIMARY KEY,
tytul VARCHAR (100) NOT NULL,
podtytul VARCHAR (200),
seria VARCHAR (200),
rok_wydania INT ,
id_wydawnictwa INT FOREIGN KEY (id_wydawnictwa) REFERENCES Wydawnictwo (id_wydawnictwa),
isbn VARCHAR(13) CONSTRAINT UQ_Ksiazki_ISBN UNIQUE
);

/*  tworzymy tabele Opis fizyczny  */
GO
CREATE TABLE Opis_fizyczny
(
format_ksiazki VARCHAR(2),
rodzaj_okladki VARCHAR(10),
id_ksiazki INT FOREIGN KEY (id_ksiazki) REFERENCES Ksiazki(id_ksiazki)
);

/*  tworzymy tabele łączacą Gatunek z Ksiazkami */
GO
CREATE TABLE Gatunek_ksiazki
(id_gatunku INT NOT NULL,
id_ksiazki INT NOT NULL ,
CONSTRAINT PK_Gatunek_ksiazki PRIMARY KEY (id_ksiazki, id_gatunku),
CONSTRAINT FK_Gatunek_ksiazki_id_ksiazki FOREIGN KEY  (id_ksiazki) REFERENCES Ksiazki(id_ksiazki),
CONSTRAINT FK_Gatunek_ksiazki_id_gatunku FOREIGN KEY (id_gatunku) REFERENCES Gatunek (id_gatunku)
);

/* tworzymy tabele łączaca tabele Ksiazki i Autor */
GO
CREATE TABLE Autorzy_ksiazki
(id_autora INT NOT NULL,
id_ksiazki INT NOT NULL,
CONSTRAINT PK_Autorzy_ksiazki PRIMARY KEY (id_ksiazki, id_autora),
CONSTRAINT FK_Autorzy_ksiazki_id_autora FOREIGN KEY (id_autora) REFERENCES Autor(id_autora),
CONSTRAINT FK_Autorzy_ksiazki_id_ksiazki FOREIGN KEY (id_ksiazki) REFERENCES Ksiazki(id_ksiazki)
);

/* wstawianie danych do tabeli Gatunek */
GO
INSERT INTO Gatunek (nazwa_gatunku) VALUES
('powieść dla dzieci'),
('opowiadanie'),
('podróżnicze'),
('edukacyjne'),
('z okienkami'),
('wierszowane'),
('picture book'),
('logopedyczne'),
('3D');


/* wstawianie danych do tabeli Wydawnictwo */
GO
INSERT INTO Wydawnictwo (nazwa_wydawnictwa) VALUES
('Egmont'),
('Babaryba'),
('Wigla'),
('Greg'),
('Mamania'),
('Olesiejuk'),
('Zakamarki'),
('Zielona Sowa'),
('Nasza Księgarnia'),
('Dwie siostry');


/* wstawiane danych do tabeli Ksiazki */
GO
INSERT INTO Ksiazki (tytul, rok_wydania, id_wydawnictwa, isbn, seria)
VALUES
('Koala, który się trzymał', 2016,8, '978380735927', NULL),
('Wiewiórki, które nie chciały się dzielić', 2017, 8, '9788380737259', NULL),
('Mysz, która chciała być lewem', 2015, 8,'9788380735934', NULL ),
('Wilk, który się zgubił', 2018,8,'9788380739482', NULL), 
('Trzymaj mnie mocno', 2019,8,'9788380737587', NULL),
('Noc na ulicy Czereśniowej', 2013,10, '9788363696405', 'Czereśniowa'),
('Wiosna na ulicy Czereśniowej',2012,10, '9788365341167', 'Czereśniowa'), 
('Zima na ulicy Czereśniowej', 2012,10, '9788365341150', 'Czereśniowa'),
('Jesień na ulicy Czereśniowej', 2012,10, '9788365341181', 'Czereśniowa'),
('Lato na ulicy Czereśniowej', 2012,10, '9788365341174', 'Czereśniowa'),
('Tola na wsi', 2019, 8, '9788381541510', 'Tola'),
('Tola w przedszkolu', 2019,8, '9788381543774', 'Tola'),
('Zima Toli', 2018,8, '9788380739246', 'Tola'),
('Lato Toli', 2019,8, '9788380738119', 'Tola'),
('Wiosna Toli', 2018,8, '9788380738102', 'Tola'),
('Jesień Toli', 2018,8, '9788380739239', 'Tola'),
('Jadzia Pętelka zostaje z nianią', 2020, 8, '9788381546898', 'Jadzia Pętelka'),
('Jadzia Pętelka idzie spać', 2019,8, '9788381543224', 'Jadzia Pętelka'),
('Jadzia Pętelka nie odda łopatki', 2020,8, '9788381545839', 'Jadzia Pętelka'),
('Jadzia Pętelka robi siku', 2019, 8, '9788381543866', 'Jadzia Pętelka'),
('Jadzia Pętelka idzie na spacer', 2020,8, '9788381545358', 'Jadzia Pętelka'),
('Jadzia Pętelka piecze pierniki', 2020,8, '9788381547734', 'Jadzia Pętelka');

/* select * from Ksiazki*/

/* wstawienie wierszy do tabeli Autor */
GO
INSERT INTO Autor (imie_autora, nazwisko_autora) VALUES
('Rachel',  'Bright'),
('Jim', 'Field'),
('Rotraut Susanne', 'Berner'),
('Anna', 'Włodarkiewicz'),
('Barbara', 'Supeł'),
('Jane', 'Chapman');

/*połaczenie ksiazek z autorami*/
GO
INSERT INTO Autorzy_ksiazki (id_ksiazki, id_autora) VALUES
(1,1),(1,2),(2,1),(2,2),(3,1),(3,2),(4,1),(4,2),(5,6),(6,3),
(7,3),(8,3),(9,3),(10,3),(11, 4),(12,4),(13,4),(14,4),(15,4),
(16,4), (17,5), (18,5), (19,5), (20,5), (21,5), (22,5);

--select * from Autorzy_ksiazki;

/* dopisanie gatunkow do ksiązek */
GO
INSERT INTO Gatunek_ksiazki (id_ksiazki, id_gatunku) VALUES
(1,6), (2,6), (3,6), (4,6), (5,2), (6,7), (7,7), (8,7), (9,7), (10,7),
(11,2), (12,2), (13,2), (14,2), (15,2), (16,2), (17, 2), (18,2), (19,2),
(20,2), (21,2), (22,2);




/* Dodanie kolumny Liczba ksiazek do tabeli Gatunek */
go
ALTER TABLE Gatunek ADD Liczba_ksiazek int not null
constraint DF_Gatunek_Liczba_ksiazek default (0)
go
/* obliczenie liczby ksiazek */
go
UPDATE Gatunek 
SET Liczba_ksiazek=
(SELECT COUNT (*) FROM Gatunek_ksiazki GK WHERE GK.id_gatunku= Gatunek.id_gatunku);

SELECT * FROM Gatunek;
SELECT * FROM Gatunek_ksiazki
GO
/* Utworzenie triggera który uaktualnia liczbę ksiązek  danego gatunku */
GO
CREATE OR ALTER TRIGGER TRG_GATUNEK_KSIAZKI_LICZBA_KSIAZEK ON DBO.Gatunek_ksiazki 
AFTER INSERT, UPDATE, DELETE
AS

BEGIN
SET NOCOUNT ON
UPDATE Gatunek 
SET Liczba_ksiazek=
(SELECT COUNT (*) FROM Gatunek_ksiazki GK WHERE GK.id_gatunku= Gatunek.id_gatunku)
WHERE id_gatunku IN
(
	SELECT DISTINCT id_gatunku  FROM inserted
	UNION
	SELECT DISTINCT id_gatunku FROM deleted
)
END;
GO

/* tworzenie procedury spDodajKsiazke, 
ktora dodaje ksiazke oraz wydawnictwo, badz informuje, że taka ksiązka juz jest w bazie */


GO
CREATE OR ALTER PROCEDURE spDodajKsiazke
@isbn VARCHAR(13),
@tytul VARCHAR(100),
@podtytul VARCHAR(200),
@rok_wydania INT,
@id_wydawnictwa INT OUTPUT,
@nazwa_wydawnictwa NVARCHAR(50) ,
@seria varchar(200),
@id_ksiazki INT OUTPUT
AS
BEGIN
	IF EXISTS (SELECT * FROM Ksiazki WHERE isbn=@isbn)
	BEGIN
	RAISERROR ('Jest już taka książka w bazie!', 11,1 )
	RETURN -1
	END
BEGIN TRY
BEGIN TRAN
	IF EXISTS (SELECT * FROM Wydawnictwo WHERE nazwa_wydawnictwa=@nazwa_wydawnictwa)
		BEGIN
		PRINT 'Jest już takie wydawnictwo w bazie'
		SELECT @id_wydawnictwa=id_wydawnictwa  FROM Wydawnictwo WHERE nazwa_wydawnictwa=@nazwa_wydawnictwa
		END
	ELSE
		BEGIN
		PRINT 'Nie ma takiego wydawnictwa'
		INSERT INTO Wydawnictwo (nazwa_wydawnictwa) VALUES (@nazwa_wydawnictwa)
		SELECT @id_wydawnictwa= SCOPE_IDENTITY()
		END


	INSERT INTO Ksiazki (isbn, tytul, podtytul, rok_wydania, id_wydawnictwa) 
	VALUES (@isbn, @tytul, @podtytul, @rok_wydania, @id_wydawnictwa)
	SELECT  @id_ksiazki =scope_identity ()
COMMIT
END TRY
BEGIN CATCH
	ROLLBACK
	PRINT 'Procedura zakończyła się błędem- dane nie zostały wprowadzone'
	; THROW
END CATCH
END ;


/*  wywołanie procedury spDodaj ksiazke */
GO
DECLARE @id_k INT, @id_wyd INT
EXEC spDodajKsiazke @isbn='9788310129070', 
@tytul='Z mucha na luzie ćwiczymy buzie, czyli zabawy logopedyczne dla dzieci',  @rok_wydania=2015, @id_ksiazki=@id_k OUTPUT, 
@podtytul= NULL , @seria=null, @nazwa_wydawnictwa= 'Nasza księgarnia', @id_wydawnictwa=@id_wyd output;
SELECT @id_k AS id_ksiazki;

select * from Ksiazki
select * from Wydawnictwo


/*tworzenie procedury spDodaj Autora, która sprawdza, czy taki autor już jest w bazie i zwraca id autora */

GO
CREATE OR ALTER PROCEDURE spDodajAutora
@imie_autora VARCHAR(20),
@nazwisko_autora VARCHAR(50),
@id_autora INT OUTPUT
AS
BEGIN
BEGIN TRY
BEGIN TRAN
	IF EXISTS (SELECT * FROM Autor WHERE imie_autora=@imie_autora AND nazwisko_autora=@nazwisko_autora)
		BEGIN
		PRINT 'Jest już taki autor w bazie'
		SELECT @id_autora= id_autora FROM Autor WHERE imie_autora=@imie_autora AND nazwisko_autora=@nazwisko_autora
		END
	ELSE
		BEGIN
		PRINT 'Nie ma takiego autora w bazie'
		INSERT INTO Autor (imie_autora, nazwisko_autora)
		VALUES (@imie_autora, @nazwisko_autora)
		SELECT @id_autora = SCOPE_IDENTITY()
		END
COMMIT
END TRY
BEGIN CATCH
	ROLLBACK
	PRINT 'Procedura zakończyła się błędem- dane nie zostały wprowadzone'
	;THROW
END CATCH
END;


/* wywołanie procedury spDodajAutora */
GO
DECLARE @id_a INT;
EXEC spDodajAutora @imie_autora='Marta', @nazwisko_autora='Galewska-Kustra', @id_autora=@id_a OUTPUT;
SELECT @id_a AS id_autora;
GO

select * from Autorzy_ksiazki


/* dodanie procedury łaczacej autora i ksiazke*/


GO
CREATE OR ALTER PROCEDURE spPolaczAutoraZKsiazka
@id_ksiazki INT,
@id_autora INT
AS
BEGIN
INSERT INTO Autorzy_ksiazki (id_ksiazki, id_autora) VALUES (@id_ksiazki, @id_autora)
END;


/* wywołanie procedury łączącej Autora z Ksiązka */
GO
EXEC spPolaczAutoraZKsiazka @id_ksiazki=23, @id_autora=7;
SELECT * FROM Autorzy_ksiazki

/* dodanie procedury do dodania Gatunku */

GO
CREATE OR ALTER PROCEDURE spDodajGatunek
@nazwa_gatunku VARCHAR (50),
@id_gatunku INT OUTPUT
AS
BEGIN
BEGIN TRY
BEGIN TRAN
	IF EXISTS (SELECT * FROM Gatunek WHERE nazwa_gatunku=@nazwa_gatunku)
		BEGIN
		PRINT 'Jest już taki gatunek w bazie'
		SELECT @id_gatunku=id_gatunku FROM Gatunek WHERE nazwa_gatunku=@nazwa_gatunku 
		END
	ELSE
		BEGIN
		PRINT 'Nie ma takiego gatunku w bazie'
		INSERT INTO Gatunek (nazwa_gatunku) VALUES (@nazwa_gatunku)
		SELECT @id_gatunku= SCOPE_IDENTITY()
		END
COMMIT
END TRY
BEGIN CATCH
	ROLLBACK
	PRINT 'Procedura zakończyła się błędem- dane nie zostały wprowadzone'
	;THROW
END CATCH
END;


/*wywołanie procedury spDodajGatunek */
GO
DECLARE @id_gat INT
EXEC spDodajGatunek @nazwa_gatunku='anglojęzyczne', @id_gatunku=@id_gat OUTPUT
SELECT @id_gat AS id_gatunku;

/* dodanie procedury łaczącej Gatunek z Ksiazka*/
GO
CREATE PROCEDURE spPolaczGatunekZKsiazka
@id_gatunku INT,
@id_ksiazki INT
AS
BEGIN
INSERT INTO Gatunek_ksiazki(id_gatunku, id_ksiazki) VALUES (@id_gatunku, @id_ksiazki)
END;


/* wywołanie procedury łaczącej Gatunek z książka */
GO
EXEC spPolaczGatunekZKsiazka @id_gatunku=7, @id_ksiazki=23;


/*dodanie procedury dodajacej wydawnictwo*/
GO
CREATE OR ALTER PROCEDURE spDodajWydawnictwo
@nazwa_wydawnictwa VARCHAR(50),
@id_wydawnictwa INT OUTPUT
AS
BEGIN
BEGIN TRY
BEGIN TRAN
	IF EXISTS (SELECT * FROM Wydawnictwo WHERE nazwa_wydawnictwa=@nazwa_wydawnictwa)
		BEGIN
		PRINT 'Jest już takie wydawnictwo w bazie'
		SELECT @id_wydawnictwa=id_wydawnictwa  FROM Wydawnictwo WHERE nazwa_wydawnictwa=@nazwa_wydawnictwa
		END
	ELSE
		BEGIN
		PRINT 'Nie ma takiego wydawnictwa'
		INSERT INTO Wydawnictwo (nazwa_wydawnictwa) VALUES (@nazwa_wydawnictwa)
		SELECT @id_wydawnictwa= SCOPE_IDENTITY()
		END
COMMIT
END TRY
BEGIN CATCH
	ROLLBACK
	PRINT 'Procedura zakończyła się błędem- dane nie zostały wprowadzone'
	;THROW
END CATCH
END;

GO



/* wywołanie procedury spDodajWydawnictwo */
GO
DECLARE @id_wyd INT
EXEC  spDodajWydawnictwo @nazwa_wydawnictwa='Nasza Księgarnia', @id_wydawnictwa=@id_wyd OUTPUT;
SELECT @id_wyd AS id_wydawnictwa;



/* tworzenie procedury spDodajDane, 
ktora dodaje ksiazke,autora, wydawnictwo, gatunek badz informuje, że taka ksiązka juz jest w bazie. 
Jak wprowadzamy błędne dane wychodzimy z procedury nie dodając nic.*/

GO
CREATE OR ALTER PROCEDURE spDodajDane
@isbn VARCHAR(13),
@tytul VARCHAR(100),
@podtytul VARCHAR(200),
@rok_wydania INT,
@id_wydawnictwa INT OUTPUT,
@nazwa_wydawnictwa NVARCHAR(50) ,
@seria varchar(200),
@id_ksiazki INT OUTPUT,
@imie_autora VARCHAR(20),
@nazwisko_autora VARCHAR(50),
@id_autora INT OUTPUT,
@nazwa_gatunku VARCHAR (50),
@id_gatunku INT OUTPUT
AS
BEGIN
	IF EXISTS (SELECT * FROM Ksiazki WHERE isbn=@isbn)
		BEGIN
		RAISERROR ('Jest już taka książka w bazie!', 11,1 )
		RETURN -1
	END
BEGIN TRY
BEGIN TRAN
	IF EXISTS (SELECT * FROM Wydawnictwo WHERE nazwa_wydawnictwa=@nazwa_wydawnictwa)
		BEGIN
		PRINT 'Jest już takie wydawnictwo w bazie'
		SELECT @id_wydawnictwa=id_wydawnictwa  FROM Wydawnictwo WHERE nazwa_wydawnictwa=@nazwa_wydawnictwa
		END
	ELSE
		BEGIN
		PRINT 'Nie ma takiego wydawnictwa'
		INSERT INTO Wydawnictwo (nazwa_wydawnictwa) VALUES (@nazwa_wydawnictwa)
		SELECT @id_wydawnictwa= SCOPE_IDENTITY()
		END
	IF EXISTS (SELECT * FROM Autor WHERE imie_autora=@imie_autora AND nazwisko_autora=@nazwisko_autora)
		BEGIN
		PRINT 'Jest już taki autor w bazie'
		SELECT @id_autora= id_autora FROM Autor WHERE imie_autora=@imie_autora AND nazwisko_autora=@nazwisko_autora
		END
	ELSE
		BEGIN
		PRINT 'Nie ma takiego autora w bazie'
		INSERT INTO Autor (imie_autora, nazwisko_autora)
		VALUES (@imie_autora, @nazwisko_autora)
		SELECT @id_autora = SCOPE_IDENTITY()
		END

	INSERT INTO Ksiazki (isbn, tytul, podtytul, rok_wydania, id_wydawnictwa) 
	VALUES (@isbn, @tytul, @podtytul, @rok_wydania, @id_wydawnictwa)
	SELECT  @id_ksiazki =scope_identity ()

	INSERT INTO Autorzy_ksiazki (id_ksiazki, id_autora) VALUES (@id_ksiazki, @id_autora)


	IF EXISTS (SELECT * FROM Gatunek WHERE nazwa_gatunku=@nazwa_gatunku)
		BEGIN
		PRINT 'Jest już taki gatunek w bazie'
		SELECT @id_gatunku=id_gatunku FROM Gatunek WHERE nazwa_gatunku=@nazwa_gatunku 
		END
	ELSE
		BEGIN
		PRINT 'Nie ma takiego gatunku w bazie'
		INSERT INTO Gatunek (nazwa_gatunku) VALUES (@nazwa_gatunku)
		SELECT @id_gatunku= SCOPE_IDENTITY()
		END
	
	INSERT INTO Gatunek_ksiazki(id_gatunku, id_ksiazki) VALUES (@id_gatunku, @id_ksiazki)

COMMIT
END TRY
BEGIN CATCH
	ROLLBACK
	PRINT 'Procedura zakończyła się błędem-dane nie zostały wprowadzone'
	;THROW
END CATCH

END ;


--wywołac procedure DodajDane

GO
DECLARE @id_k INT, @id_wyd INT, @id_a INT, @id_g int
EXEC spDodajDane @isbn='9788375510300', 
@tytul='Opowiadania z piaskownicy',  @rok_wydania=2017,
@id_ksiazki=@id_k OUTPUT, 
@podtytul= NULL , @seria=null, @nazwa_wydawnictwa= 'BIS',@imie_autora='Renata',@nazwisko_autora= 'Piątkowska',
@id_autora=@id_a OUTPUT, @id_wydawnictwa=@id_wyd output,  @nazwa_gatunku='opowiadanie',
@id_gatunku=@id_g output;
SELECT @id_k AS id_ksiazki, @id_a as id_autora, @id_wyd as id_wydawnictwa, @id_g as id_gatunku;

select * from Gatunek


/*--wyświelenie  podstawowych danych o książkach */
GO
CREATE VIEW PodstawoweDaneKsiazki AS
SELECT k.id_ksiazki
, k.tytul
, k.isbn
, k.rok_wydania
, a.imie_autora + ' '+a.nazwisko_autora AS 'Imię_Nazwisko_Autora'
, g.nazwa_gatunku
, w.nazwa_wydawnictwa
FROM Ksiazki k
LEFT JOIN Autorzy_ksiazki ak ON ak.id_ksiazki=k.id_ksiazki
LEFT JOIN Autor a ON a.Id_autora=ak.id_autora
LEFT JOIN Gatunek_ksiazki gk ON gk.id_ksiazki=k.id_ksiazki
LEFT JOIN Gatunek g ON g.id_gatunku=gk.id_gatunku
LEFT JOIN Wydawnictwo w ON w.id_wydawnictwa=k.id_wydawnictwa

GO
SELECT * FROM PodstawoweDaneKsiazki
GO




/*
select * from Gatunek
SELECT * FROM Gatunek_ksiazki
select * from Ksiazki
*/