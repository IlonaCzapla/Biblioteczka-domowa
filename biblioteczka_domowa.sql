drop database Biblioteczka_domowa;
create database Biblioteczka_domowa;

go
use Biblioteczka_domowa;
go
/*   tworzymy tabele Gatunek   */

create table Gatunek
(id_gatunku int IDENTITY primary key ,
nazwa_gatunku varchar(50)
);

/*  tworzymy tabele Wydawnictwo  */

create table Wydawnictwo
(
id_wydawnictwa int IDENTITY primary key,
nazwa_wydawnictwa varchar(50)
);

/*  tworzymy tabele Autor  */

create table Autor
(
Id_autora int not null identity primary key,
imie_autora varchar(20) not null,
nazwisko_autora varchar (50) not null
);

/*  tworzymy tabele Ksiazki  */

create table Ksiazki
( 
id_ksiazki int not null identity primary key,
tytul varchar (100) not null,
podtytul varchar(200),
seria varchar(200),
rok_wydania int,
id_wydawnictwa int foreign key (id_wydawnictwa) references Wydawnictwo (id_wydawnictwa),
isbn varchar(13) Unique
);

/*  tworzymy tabele Opis fizyczny  */

create table Opis_fizyczny
(format_ksiazki varchar(2),
rodzaj_okladki varchar(10),
id_ksiazki int foreign key (id_ksiazki) references Ksiazki(id_ksiazki) ,
);

/*  tworzymy tabele ³¹czac¹ Gatunek z Ksiazkami */

create table Gatunek_ksiazki
(id_gatunku int not null,
id_ksiazki int not null,
constraint PK_Gatunek_ksiazki Primary key (id_ksiazki, id_gatunku),
constraint FK_Gatunek_ksiazki_id_ksiazki Foreign key (id_ksiazki) references Ksiazki(id_ksiazki),
constraint FK_Gatunek_ksiazki_id_gatunku Foreign key (id_gatunku) references Gatunek (id_gatunku)
);

/* tworzymy tabele ³¹czaca tabele Ksiazki i Autor */

create table Autorzy_ksiazki
(id_autora int not null,
id_ksiazki int not null,
constraint PK_Autorzy_ksiazki primary key (id_ksiazki, id_autora),
constraint FK_Autorzy_ksiazki_id_autora foreign key (id_autora) references Autor(id_autora),
constraint FK_Autorzy_ksiazki_id_ksiazki foreign key (id_ksiazki) references Ksiazki(id_ksiazki),
);

/* wstawianie danych do tabeli Gatunek */

insert into Gatunek (nazwa_gatunku) values
('powieœæ dla dzieci'),
('opowiadanie'),
('podró¿nicze'),
('edukacyjne'),
('z okienkami'),
('wierszowane'),
('picture book'),
('logopedyczne'),
('3D');


/* wstawianie danych do tabeli Wydawnictwo */

insert into Wydawnictwo (nazwa_wydawnictwa) values
('Egmont'),
('Babaryba'),
('Wigla'),
('Greg'),
('Mamania'),
('Olesiejuk'),
('Zakamarki'),
('Zielona Sowa'),
('Nasza Ksiêgarnia'),
('Dwie siostry')


/* wstawiane danych do tabeli Ksiazki */

insert into Ksiazki (tytul, rok_wydania, id_wydawnictwa, isbn, seria)
values
('Koala, który siê trzyma³', 2016,8, '978380735927', null),
('Wiewiórki, które nie chcia³y siê dzieliæ', 2017, 8, '9788380737259', null),
('Mysz, która chcia³a byæ lewem', 2015, 8,'9788380735934', null ),
('Wilk, który siê zgubi³', 2018,8,'9788380739482', null), 
('Trzymaj mnie mocno', 2019,8,'9788380737587', null),
('Noc na ulicy Czereœniowej', 2013,10, '9788363696405', 'Czereœniowa'),
('Wiosna na ulicy Czereœniowej',2012,10, '9788365341167', 'Czereœniowa'), 
('Zima na ulicy Czereœniowej', 2012,10, '9788365341150', 'Czereœniowa'),
('Jesieñ na ulicy Czereœniowej', 2012,10, '9788365341181', 'Czereœniowa'),
('Lato na ulicy Czereœniowej', 2012,10, '9788365341174', 'Czereœniowa'),
('Tola na wsi', 2019, 8, '9788381541510', 'Tola'),
('Tola w przedszkolu', 2019,8, '9788381543774', 'Tola'),
('Zima Toli', 2018,8, '9788380739246', 'Tola'),
('Lato Toli', 2019,8, '9788380738119', 'Tola'),
('Wiosna Toli', 2018,8, '9788380738102', 'Tola'),
('Jesieñ Toli', 2018,8, '9788380739239', 'Tola'),
('Jadzia Pêtelka zostaje z niani¹', 2020, 8, '9788381546898', 'Jadzia Pêtelka'),
('Jadzia Pêtelka idzie spaæ', 2019,8, '9788381543224', 'Jadzia Pêtelka'),
('Jadzia Pêtelka nie odda ³opatki', 2020,8, '9788381545839', 'Jadzia Pêtelka'),
('Jadzia Pêtelka robi siku', 2019, 8, '9788381543866', 'Jadzia Pêtelka'),
('Jadzia Ptelka idzie na spacer', 2020,8, '9788381545358', 'Jadzia Pêtelka'),
('Jadzia Pêtelka piecze pierniki', 2020,8, '9788381547734', 'Jadzia Pêtelka');

/* select * from Ksiazki*/

/* wstawienie wierszy do tabeli Autor */

insert into Autor (imie_autora, nazwisko_autora) values
('Rachel',  'Bright'),
('Jim', 'Field'),
('Rotraut Susanne', 'Berner'),
('Anna', 'W³odarkiewicz'),
('Barbara', 'Supe³'),
('Jane', 'Chapman');

/*po³aczenie ksiazek z autorami*/
insert into Autorzy_ksiazki (id_ksiazki, id_autora) values
(1,1),(1,2),(2,1),(2,2),(3,1),(3,2),(4,1),(4,2),(5,6),(6,3),
(7,3),(8,3),(9,3),(10,3),(11, 4),(12,4),(13,4),(14,4),(15,4),
(16,4), (17,5), (18,5), (19,5), (20,5), (21,5), (22,5);

--select * from Autorzy_ksiazki;

/* dopisanie gatunkow do ksi¹zek */

insert into Gatunek_ksiazki (id_ksiazki, id_gatunku) values
(1,6), (2,6), (3,6), (4,6), (5,2), (6,7), (7,7), (8,7), (9,7), (10,7),
(11,2), (12,2), (13,2), (14,2), (15,2), (16,2), (17, 2), (18,2), (19,2),
(20,2), (21,2), (22,2);



/* tworzenie procedury spDodajKsiazke, 
ktora dodaje ksiazke, badz informuje, ¿e taka ksi¹zka juz jest w bazie */

GO
create or alter procedure spDodajKsiazke
@isbn varchar(13),
@tytul varchar(100),
@podtytul varchar(200),
@rok_wydania int,
@id_wydawnictwa int,
@id_ksiazki int output
as
begin
	if exists (select * from Ksiazki where isbn=@isbn)
	begin
	raiserror ('Jest ju¿ taka ksi¹¿ka w bazie!', 11,1 )
	return -1
	end
	
	insert into dbo.Ksiazki (isbn, tytul, podtytul, rok_wydania, id_wydawnictwa) 
	values (@isbn, @tytul, @podtytul, @rok_wydania, @id_wydawnictwa)
	select  @id_ksiazki =scope_identity ()
end;


/*tworzenie procedury spDodaj Autora, która sprawdza, czy taki autor ju¿ jest w bazie i zwraca id autora */

go
create or alter procedure spDodajAutora
@imie_autora Varchar(20),
@nazwisko_autora varchar(50),
@id_autora int output
as
begin
	if exists (Select * from Autor where imie_autora=@imie_autora and nazwisko_autora=@nazwisko_autora)
	begin
	print 'Jest ju¿ taki autor w bazie'
	select @id_autora= id_autora from Autor where imie_autora=@imie_autora and nazwisko_autora=@nazwisko_autora
	end
	else
	begin
	print 'Nie ma takiego autora w bazie'
	insert into Autor (imie_autora, nazwisko_autora)
	values (@imie_autora, @nazwisko_autora)
	select @id_autora = SCOPE_IDENTITY()
	end
end;


/* dodanie procedury ³aczacej autora i ksiazke*/
go
create or alter procedure spPolaczAutoraZKsiazka
@id_ksiazki int,
@id_autora int
as
begin
insert into Autorzy_ksiazki (id_ksiazki, id_autora) values (@id_ksiazki, @id_autora)
end;

/* dodanie procedury do dodania Gatunku */
go
create or alter procedure spDodajGatunek
@nazwa_gatunku varchar(50),
@id_gatunku int output
as
begin
	if exists (select * from Gatunek where nazwa_gatunku=@nazwa_gatunku)
		begin
		raiserror ('Jest ju¿ taki gatunek',11,1)
		end
	else
	insert into Gatunek (nazwa_gatunku) values (@nazwa_gatunku)
	select @id_gatunku= SCOPE_IDENTITY()
end;

/* dodanie procedury ³acz¹cej Gatunek z Ksiazka*/
go
create procedure spPolaczGatunekZKsiazka
@id_gatunku int,
@id_ksiazki int
as
begin
insert into Gatunek_ksiazki(id_gatunku, id_ksiazki) values (@id_gatunku, @id_ksiazki)
end;


/*dodanie procedury dodajacej wydawnictwo*/
go
create or alter procedure spDodajWydawnictwo
@nazwa_wydawnictwa varchar(50),
@id_wydawnictwa int output
as
begin
	if exists (select * from Wydawnictwo where nazwa_wydawnictwa=@nazwa_wydawnictwa)
		begin
		raiserror ('Jest ju¿ takie wydawnictwo',11,1)
		end
	else
	insert into Wydawnictwo (nazwa_wydawnictwa) values (@nazwa_wydawnictwa)
	select @id_wydawnictwa= SCOPE_IDENTITY()
end;

go


/*  wywo³anie procedury spDodaj ksiazke */

declare @id_k int;
exec spDodajKsiazke @isbn='9788310129079', 
@tytul='Z mucha na luzie æwiczymy buzie, czyli zabawy logopedyczne dla dzieci',  @rok_wydania=2015, @id_ksiazki=@id_k output, 
@podtytul= null, @id_wydawnictwa=8;
select @id_k as id_ksiazki;

/* wywo³anie procedury spDodajAutora */

declare @id_a int;
exec spDodajAutora @imie_autora='Marta', @nazwisko_autora='Galewska-Kustra', @id_autora=@id_a output;
select @id_a as id_autora;

select * from Autorzy_ksiazki


/* wywo³anie procedury ³¹cz¹cej Autora z Ksi¹zka */
exec spPolaczAutoraZKsiazka @id_ksiazki=23, @id_autora=7;
select * from Autorzy_ksiazki

/*wywo³anie procedury spDodajGatunek */

declare @id_gat int
exec spDodajGatunek @nazwa_gatunku='anglojêzyczne', @id_gatunku=@id_gat output
select @id_gat as id_gatunku;

/* wywo³anie procedury ³acz¹cej Gatunek z ksia¿ka */

exec spPolaczGatunekZKsiazka @id_gatunku=7, @id_ksiazki=23

/* wywo³anie procedury spDodajWydawnictwo */

declare @id_wyd int
exec  spDodajWydawnictwo @nazwa_wydawnictwa='Nasza Ksiêgarnia1', @id_wydawnictwa=@id_wyd output;
select @id_wyd as id_wydawnictwa;


/*--wyœwielenie  podstawowych danych o ksi¹¿kach */

select k.id_ksiazki
, k.tytul
, k.rok_wydania
, a.imie_autora + ' '+a.nazwisko_autora as 'Imiê_Nazwisko_Autora'
, g.nazwa_gatunku
, w.nazwa_wydawnictwa
from Ksiazki k
left join Autorzy_ksiazki ak on ak.id_ksiazki=k.id_ksiazki
left join Autor a on a.Id_autora=ak.id_autora
left join Gatunek_ksiazki gk on gk.id_ksiazki=k.id_ksiazki
left join Gatunek g on g.id_gatunku=gk.id_gatunku
left join Wydawnictwo w on w.id_wydawnictwa=k.id_wydawnictwa



