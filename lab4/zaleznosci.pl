% program: zaleznosci
/*1*/ p(a,d).
/*2*/ p(X,Y):-q(X,Z),r(Z,Y).
/*3*/ q(a,b).
/*4*/ q(c,a).
/*5*/ r(a,d).
/*6*/ r(b,c).
