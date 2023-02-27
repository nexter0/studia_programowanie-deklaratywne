% na(X,Y)
% opis: spełniony, gdy klocek X leży bezpośrednio na klocku Y
%
% pod(X,Y)
% opis: spełniony, gdy klocek X leży bezpośrednio pod klockiem Y
%
% między(X,Y,Z)
% opis: spełniony, gdy klocek X leży między klockiem Y a klockiem Z
% --------------------------------
na(c,a).
na(c,b).
na(d,c).

pod(X,Y):-na(Y,X).

między(X,Y,Z):-na(Z,X),na(X,Y).
między(X,Y,Z):-na(Y,X),na(X,Z).
% --------------------------------

/*
 * Informacje o budowie programu:
 * 6 klauzul
 * 3 definicje relacji: na/2, pod/2, między/3
 * 3 klauzle, które są faktami
 * definicja na/2 składa się z 3 faktów
 * definicja pod/2 składa się z 1 reguły
 * definicja między/3 składa się z 3 faktów
 */

