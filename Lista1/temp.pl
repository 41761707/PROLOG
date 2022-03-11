is_prime(2).
is_prime(3).
is_prime(P) :- 
    integer(P), 
    P > 3, 
    P mod 2 =\= 0, 
    \+ has_factor(P,3).  

has_factor(N,L) :- N mod L =:= 0.
has_factor(N,L) :- 
    L * L < N, 
    L2 is L + 2, 
    has_factor(N,L2).

prime_list(A,B,L) :- 
    A1 is (A // 2) * 2 + 1, 
    p_list(A1,B,L).


p_list(A,B,[]) :- A > B, !.
p_list(A,B,[A|L]) :- 
    is_prime(A), !, 
    next(A,A1), 
    p_list(A1,B,L).

p_list(A,B,L) :- 
    next(A,A1), 
    p_list(A1,B,L).

next(2,3) :- !.
next(A,A1) :- A1 is A + 2.