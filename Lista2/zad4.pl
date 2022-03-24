lista(N, X) :-
    numlist(1, N, A),
    sztywno(X, A),
    permutation(A, B),
    zamiana(X, B).      

sztywno([], []).
sztywno([X, _|L], [X|R]) :- 
    sztywno(L, R).

zamiana([], []).
zamiana([_, X|L], [X|R]) :-    
    zamiana(L, R).