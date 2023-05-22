% sejfy i kasy pancerne
% predykat sejf/6:
% sejf(Nazwa, Typ, Rozmiar, LimitWartosci, Cena, Zamek) - definicja sejfu

sejf('Sejf domowy D 109-08', 
     domowy, mały, 20000, 700, klucz).
sejf('Sejf antywłamaniowy F 103-01 Blanco',
     biurowy, mały, 20000, 1200, klucz).
sejf('Sejf biurowy HTIV 415-21',
     biurowy, mały, 150000, 1800, szyfr).
sejf('Sejf na broń długą WT 270-01',
     na_broń, duży, 20000, 3500, szyfr).
sejf('Sejf na broń krótką WS 145-01',
     na_broń, mały, 2500, 1000, klucz).
sejf('Szafa pancerna EP 233-2A',
     szafa, duży, 50000, 5400, klucz).
sejf('Szafa pancerna EPX 238-SX',
     szafa, duży, 100000, 8300, szyfr).
sejf('Szafa pancerna EXT 22A V100',
     szafa, duży, 75000, 11000, elektroniczny).
sejf('Szafa pancerna EXT 22C-B V120',
     szafa, duży, 75000, 26450, biometria).
sejf('Sejf domowy D 22-11',
     domowy, średni, 20000, 1800, szyfr).
sejf('Sejf antywłamaniowy MAG3-223EX',
     biurowy, średni, 50000, 6500, szyfr).
sejf('Sejf na laptopa HS 420-02 V110',
     hotelowy, mały, 2000, 950, elektroniczny).
sejf('Sejf na dokumenty HS 421-DC V100',
     hotelowy, mały, 5000, 1500, elektroniczny).
sejf('Sejf biometryczny HS 420-02 V110',
     hotelowy, mały, 5000, 3100, biometria).
sejf('Sejf przeciwpożarowy SV8-ED',
     biurowy, średni, 10000, 4300, klucz).
sejf('Szafa pancerna przeciwpożarowa EXT S38-ED',
     szafa, duży, 50000, 18500, klucz).
sejf('Sejf na biżuterię D 38EB-BE',
     domowy, mały, 10000, 1900, elektroniczny).
sejf('Sejf domowy D ER93-E2',
     domowy, mały, 5000, 1450, szyfr).
sejf('Sejf na broń GU2-EXT EXTRA',
     na_broń, średni, 50000, 11300, elektroniczny).
sejf('Sejf na broń GU1-B',
     na_broń, średni, 50000, 4950, szyfr).
sejf('Sejf na laptopa HS 410-0H',
     hotelowy, mały, 3000, 2100, szyfr).
sejf('Sejf na dokumenty D 421-DC V120',
     domowy, mały, 7500, 3100, biometria).
sejf('Sejf biometryczny HS 426-2H V200',
     hotelowy, średni, 40000, 6700, biometria).
sejf('Szafa przeciwpożarowa EPX SV15 V100',
     szafa, duży, 75000, 17500, szyfr).

% >> predykat dowolny/1: <<
% dowolny(X) - spełniony, gdy X == dowolny
dowolny(X):- X==dowolny.

% >> predykat wypisz_cena/2: <<
% wypisz_cena(Sejf, Cena) - spełniony, gdy sejf Sejf ma cenę równą Cena
wypisz_cena(Sejf, Cena):-sejf(Sejf,_,_,_,Cena,_).

% >> predykat wartosc/2: <<
% wartosc(Sejf, Wartosc) - spełniony, gdy sejf Sejf może przechowywać 
% przedmioty o wartości conajmniej Wartosc 
% wartosc(Sejf, 20000).	
wartosc(Sejf, Wartosc):-(dowolny(Wartosc), !);
    sejf(Sejf,_,_,WarSejf,_,_), WarSejf>=Wartosc.

% >> predykat cenaMax/2: <<
% cenaMax(Sejf, Cena) - spełniony, gdy sejf Sejf jest niedroższy niż podana Cena lub Cena == dowolny
% cenaMax(X, 2000),
cenaMax(Sejf, Cena):-(dowolny(Cena), !); 
    (sejf(Sejf,_,_,_,CenaSejf,_), CenaSejf=<Cena).

% >> predykat cenaMin/2: <<
% cenaMin(Sejf, Cena) - spełniony, gdy sejf Sejf kosztuje conajmniej podaną Cena lub Cena == dowolny
% cenaMin(X, 2000).
cenaMin(Sejf, Cena):-(dowolny(Cena), !); 
    (sejf(Sejf,_,_,_,CenaSejf,_), CenaSejf>=Cena).


% >> predykat typ/2: <<
% typ(Sejf, Typ) - spełniony, gdy sejf Sejf jest typu Typ lub Typ == dowolny. 
% typ(X, biurowy).
typ(Sejf, Typ):-(dowolny(Typ), !); 
    (sejf(Sejf,TypSejf,_,_,_,_), TypSejf==Typ).


% >> predykat rozmiar/2: <<
% rozmiar(Sejf, Rozmiar) - spełniony, gdy sejf Sejf jest rozmiaru Rozmiar lub Rozmiar == dowolny. 
% rozmiar(X, średni).
rozmiar(Sejf, Rozmiar):-(dowolny(Rozmiar), !); 
    (sejf(Sejf,_,RozmSejf,_,_,_), RozmSejf==Rozmiar).

% >> predykat zamek/2: <<
% zamek(Sejf, Rozmiar) - spełniony, gdy sejf Sejf wyposażono w zamek typu Zamek lub Zamek == dowolny. 
% zamek(X, klucz).
zamek(Sejf, Zamek):-(dowolny(Zamek), !); 
    (sejf(Sejf,_,_,_,_,ZamekSejf), ZamekSejf==Zamek).

% >> predykat filtruj/6: <<
% filtruj(X, FBudzet, FTyp, FRozmiar, FZamek, FWartosc) - spełniony, gdy sejf o nazwie X
% spełnia założenia predykatów cenaMax/2, typ/2, rozmiar/2, zamek/2, wartosc/2
filtruj(X, FBudzet, FTyp, FRozmiar, FZamek, FWartosc):-sejf(X,_,_,_,_,_),
    cenaMax(X,FBudzet),
    typ(X,FTyp),
    rozmiar(X,FRozmiar),
    zamek(X,FZamek),
    wartosc(X,FWartosc).

% >> predykat asystent/0: <<
% funkcja główna programu -- interakcja z użytkownikiem
asystent:-
    write('Jaki budżet posiadasz? (podaj maksymalną cenę sejfu w zł)'),
    read(ABudzet),
    write('Jaki rodzaj sejfu? (domowy/biurowy/szafa/na_broń/hotelowy)'),
    read(ATyp),
    write('Jakiego rozmiaru sejfu poszukujesz? (mały/średni/duży)'),
    read(ARozmiar),
    write('Jakiego typu zabezpieczenie? (klucz/szyfr/elektryczny/biometria)'),
    read(AZamek),
    write('Jaką wartość w przybliżeniu będzie miała zawartość sejfu (w zł)'),
    read(AWartosc),
    findall(Sejf, filtruj(Sejf, ABudzet, ATyp, ARozmiar, AZamek, AWartosc), SejfLista),
	wypisz_sejfy(SejfLista),
    !.

% >> predykat wypisz_sejfy/1: <<
% wypisuje rekurencyjnie zawartość listy
wypisz_sejfy([]):- !. % warunek stopu
wypisz_sejfy([H|T]) :-
  writeln(H),
  wypisz_sejfy(T),
  !.  

% >> predykat koszyk/1: <<
% koszyk(Lista) - pobiera nazwy sejfów i dopisuje je do listy
koszyk(KoszykLista) :-
    write('Podaj nazwę sejfu (lub wpisz koniec)'),
    read(Nazwa),
    dodaj_sejf(Nazwa, KoszykLista).

% >> predykat dodaj_sejf/2: <<
% dodaje rekurencyjnie sejfy do tablicy
dodaj_sejf(koniec, []) :- !.
dodaj_sejf(Nazwa, [Nazwa | Reszta]) :-
    koszyk(Reszta).

    
