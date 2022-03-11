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

prime(A,B,L) :- 
    A1 is (A // 2) * 2 + 1, 
    prime_list(A1,B,L).


prime_list(A,B,[]) :- A > B, !.
prime_list(A,B,[A|L]) :- 
    prime_number(A), !, 
    next(A,A1), 
    prime_list(A1,B,L).

prime_list(A,B,L) :- 
    next(A,A1), 
    prime_list(A1,B,L).

next(2,3) :- !.
next(A,A1) :- A1 is A + 2.