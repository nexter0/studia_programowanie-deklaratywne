% urodzony/2
% urodzony(X, Y)
% osoba X urodziła się w roku Y
urodzony(jan,1974).
urodzony(ludwik,1976).
urodzony(maciej,1960).
urodzony(grzegorz,1975).
% starszy/2
% starszy(X, Y)
% osoba X jest starsza niż osoba Y
starszy(X,Y):-urodzony(X,A),urodzony(Y,B),A<B.
