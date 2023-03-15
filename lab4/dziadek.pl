%program: dziadek
%
/*1*/ ojciec(karol,jan).
/*2*/ ojciec(karol,adam).
/*3*/ dziecko(tomasz,jan).
/*4*/ dziecko(piotr,adam).
/*5*/ dziadek(karol,marek).
/*6*/ dziadek(X,Y):-ojciec(X,Z),dziecko(Y,Z).





