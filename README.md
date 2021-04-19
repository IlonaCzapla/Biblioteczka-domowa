# Biblioteczka-domowa
Projekt przedstawia bazę danych Biblioteczka domowa.
Baza powstała z myślą uporządkowania książek, które posiadam w domu.

Opis bazy:

Książka może posiadać wielu autorów, a autor może napisać wiele książek, dlatego pomiędzy tabelą Ksiazki a Autor jest tabela wiążąca Autorzy_ksiązki, która umożwiliwa powiązanie wiele do wielu (n-n). Podobnie jest z gatunkiem- książkę można przyporządkować do wielu gatunków i wiele książek może być jednego gatunku.
Stworzyłam procedury składowane, która ułatwiają (i nie pozwalają wstawiać duplikatów) wstawianie kolejnego egemplarza książki, autora, rodzaju gatunku,
kolejnego wydawnictwa. 
Dodałam trigger, zlicza ilość książek w danym gatunku.

Projekt będzie rozbudowywany i udoskonalany.
