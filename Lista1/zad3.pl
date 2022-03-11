prime_number(2).
prime_number(3).
prime_number(P) :- 
    integer(P), 
    P > 3, 
    P mod 2 =\= 0, 
    \+ factor(P,3).  

factor(N,L) :- N mod L =:= 0.
factor(N,L) :- 
    L * L < N, 
    L2 is L + 2, 
    factor(N,L2).

prime(LO,HI,[]) :- 
    LO>HI, !.
prime(LO,HI,[LO|L]) :-
    prime_number(LO), !,
    next(LO,LO1),
    prime(LO1,HI,L).

prime(LO,HI,L) :-
    next(LO,LO1),
    prime(LO1,HI,L).

next(A,A1) :- A1 is A + 1.