% sejfy i kasy pancerne
% sejf/6
% sejf(Nazwa, Typ, Rozmiar, LimitWartosci, Cena, Zamek)
sejf('Sejf domowy D 109-08', 
     'Domowy', 'Mały', 20000, 700, 'Klucz').
sejf('Sejf antywłamaniowy F 103-01 Blanco',
     'Biurowy', 'Mały', 20000, 1200, 'Klucz').
sejf('Sejf biurowy HTIV 415-21',
     'Biurowy', 'Mały', 150000, 1200, 'Szyfr').
sejf('Sejf na broń długą WT 270-01',
     'Na broń', 'Duży', 20000, 3500, 'Szyfr').
sejf('Sejf na broń krótką WS 145-01',
     'Na broń', 'Mały', 2500, 1000, 'Klucz').
sejf('Szafa pancerna EP 233-2A',
     'Szafa', 'Duży', 50000, 5400, 'Klucz').
sejf('Szafa pancerna EPX 238-SX',
     'Szafa', 'Duży', 100000, 8300, 'Szyfr').
sejf('Szafa pancerna EXT 22A V100',
     'Szafa', 'Duży', 75000, 11000, 'Elektroniczny').
sejf('Szafa pancerna EXT 22C-B V120',
     'Szafa', 'Duży', 75000, 26450, 'Biometria').
sejf('Sejf domowy D 22-11',
     'Domowy', 'Średni', 20000, 1800, 'Szyfr').
sejf('Sejf antywłamaniowy MAG3-223EX',
     'Biurowy', 'Średni', 50000, 6500, 'Szyfr').
sejf('Sejf na laptopa HS 420-02 V110',
     'Hotelowy', 'Mały', 2000, 950, 'Elektroniczny').
sejf('Sejf na dokumenty HS 421-DC V100',
     'Hotelowy', 'Mały', 5000, 1500, 'Elektroniczny').
sejf('Sejf biometryczny HS 420-02 V110',
     'Hotelowy', 'Mały', 5000, 3100, 'Biometria').

sejf(Y,X,_,_,_,_):-write(X),write(Y),nl,fail.

zapytanie:-write('Do czego potrzebny jest sejf? (na bron/na przechowywanie pieniedzy/na przechowywanie rzeczy'),
    read(question),
    dla_odpowiedzi(question).
% predykat wartosc/2
/* wartosc(Sejf, Wartosc) - spełniony, gdy sejf Sejf może przechowywać 
   przedmioty o wartości conajmniej Wartosc */
wartosc(Sejf, Wartosc):-sejf(Sejf,_,_,WarSejf,_,_), WarSejf>=Wartosc, !.

% predykat cenaMax/2
/* cenaMax(Sejf, Cena) - spełniony, gdy sejf Sejf jest niedroższy niż
 * podana Cena */
cenaMax(Sejf, Cena):-sejf(Sejf,_,_,_,CenaSejf,_), CenaSejf=<Cena, !.

zapytanie:-write('Do czego potrzebny jest sejf? (na_bron/na_przechowywanie_pieniedzy/na_przechowywanie_rzeczy'),
    read(Question),
    dla_odpowiedzi(Question).
dla_odpowiedzi(na_bron):-sejf(X,Y,_,_,_,_),Y=='Na broń',write(X).
dla_odpowiedzi(na_przechowywanie_pieniedzy):-sejf(X,Y,_,_,_,_),Y=='Biurowy',write(X).
dla_odpowiedzi(na_przechowywanie_rzeczy):-sejf(X,Y,_,_,_,_),Y=='Biurowy',write(X).

