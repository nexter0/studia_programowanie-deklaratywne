% sejfy i kasy pancerne
% predykat sejf/6:
% sejf(Nazwa, Typ, Rozmiar, LimitWartosci, Cena, Zamek) - definicja sejfu

sejf('Sejf domowy D 109-08', 
     'Domowy', mały, 20000, 700, klucz).
sejf('Sejf antywłamaniowy F 103-01 Blanco',
     biurowy, mały, 20000, 1200, klucz).
sejf('Sejf biurowy HTIV 415-21',
     biurowy, mały, 150000, 1200, szyfr).
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
     'Domowy', 'Średni', 20000, 1800, szyfr).
sejf('Sejf antywłamaniowy MAG3-223EX',
     biurowy, 'Średni', 50000, 6500, szyfr).
sejf('Sejf na laptopa HS 420-02 V110',
     hotelowy, mały, 2000, 950, elektroniczny).
sejf('Sejf na dokumenty HS 421-DC V100',
     hotelowy, mały, 5000, 1500, elektroniczny).
sejf('Sejf biometryczny HS 420-02 V110',
     hotelowy, mały, 5000, 3100, biometria).


wypisz_sejf(Y,X,_,_,_,_):-write(X), write(Y), nl, fail.

% predykat wartosc/2:
/* wartosc(Sejf, Wartosc) - spełniony, gdy sejf Sejf może przechowywać 
 * przedmioty o wartości conajmniej Wartosc 
 * wartosc(Sejf, 20000).											 */
wartosc(Sejf, Wartosc):-sejf(Sejf,_,_,WarSejf,_,_), WarSejf>=Wartosc.

% predykat cenaMax/2:
/* cenaMax(Sejf, Cena) - spełniony, gdy sejf Sejf jest niedroższy niż podana Cena
 * cenaMax(X, 2000),														 */
cenaMax(Sejf, Cena):-sejf(Sejf,_,_,_,CenaSejf,_), CenaSejf=<Cena.

% predykat cenaMin/2:
/* cenaMin(Sejf, Cena) - spełniony, gdy sejf Sejf kosztuje conajmniej podaną Cena 
 * cenaMin(X, 2000).															*/
cenaMin(Sejf, Cena):-sejf(Sejf,_,_,_,CenaSejf,_), CenaSejf>=Cena.


% predykat typ/2:
/* typ(Sejf, Typ) - spełniony, gdy sejf Sejf jest typu Typ. 
 * typ(X, 'Biurowy').									*/
typ(Sejf, Typ):-sejf(Sejf,TypSejf,_,_,_,_), TypSejf==Typ.


% predykat rozmiar/2:
/* rozmiar(Sejf, Rozmiar) - spełniony, gdy sejf Sejf jest rozmiaru Rozmiar. 
 * rozmiar(X, 'Średni').												*/	
rozmiar(Sejf, Rozmiar):-sejf(Sejf,_,RozmSejf,_,_,_), RozmSejf==Rozmiar.

% predykat zamek/2:
/* zamek(Sejf, Rozmiar) - spełniony, gdy sejf Sejf wyposażono w zamek typu Zamek. 
 * zamek(X, 'Klucz').												*/	
zamek(Sejf, Zamek):-sejf(Sejf,_,_,_,_,ZamekSejf), ZamekSejf==Zamek.

% predykat filtruj/3:
filtruj(X, FBudzet, FZawartosc, FRozmiar):-sejf(X,Y,_,_,_,_),
    cenaMax(X,FBudzet),
    Y==FZawartosc,
    rozmiar(X,FRozmiar).

% predykat asystent/0:

asystent:-
    write('Jaki budżet posiadasz? (Podaj maksymalną cenę sejfu w zł: )'),
    read(ABudzet),
    write('Jaki rodzaj sejfu? (domowy/biurowy/szafa/na broń)'),
    read(AZawartosc),
    write('Jakiego rozmiaru sejfu poszukujesz? (mały/średni/duży)'),
    read(ARozmiar),
    findall(Sejf, filtruj(Sejf, ABudzet, AZawartosc, ARozmiar), SejfList),
	print_sejf_list(SejfList).
	
print_sejf_list([]).
print_sejf_list([Sejf|Rest]) :-
  writeln(Sejf),
  print_sejf_list(Rest).


/*zapytanie:-write('Do czego potrzebny jest sejf? (na_bron/na_przechowywanie_pieniedzy/na_przechowywanie_rzeczy/na_przechowywanie_rzeczy_gości)'),
    read(Question),
    dla_odpowiedzi(Question).
dla_odpowiedzi(na_bron):-sejf(X,Y,_,_,_,_),Y=='Na broń',write(X).
dla_odpowiedzi(na_przechowywanie_pieniedzy):-sejf(X,Y,_,_,_,_),(Y=='Biurowy';Y=='Szafa'),write(X).
dla_odpowiedzi(na_przechowywanie_rzeczy):-sejf(X,Y,_,_,_,_),(Y=='Biurowy';Y=='Szafa'),write(X).
dla_odpowiedzi(na_przechowywanie_rzeczy_gości):-sejf(X,Y,_,_,_,_),(Y=='Hotelowy';Y=='Szafa'),write(X). */
