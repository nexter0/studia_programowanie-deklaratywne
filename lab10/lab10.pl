liczba_elem2(L,N):-liczba_elem_ak(L,0,N).

liczba_elem_ak([],A,A).
liczba_elem_ak([_|T],A,N):-
    A1 is A+1,
    liczba_elem_ak(T,A1,N).

konkat([],L,L).
konkat([H1|T1],L2,[H1,T3]):-konkat(T1,L2,T3).

odwrotna(L1,L2):-odwrotna_ak(L1,[],L2).
odwrotna_ak([],A,A).
odwrotna_ak([H|T],A,L2):-odrotna_ak(T,[H|A],L2).

element(E,[E|_]).
element(E,[_|T]):-element(E,T).
