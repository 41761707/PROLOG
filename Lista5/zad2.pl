board(L) :-
	length(L, N),
	horizontal(N),
	( 0 is N mod 2 -> whiteRow(N, 1, L) ; blackRow(N, 1, L)).

horizontal(N) :-
	write("+"),
	horizontal(N, N).

horizontal(_, 0):- nl, !.

horizontal(N, C) :-
	write("-----+"),
	NewC is C - 1,
	horizontal(N, NewC).

whiteRow(N, N, [H | _]) :-
	line(N, H, white),
	line(N, H, white),
	horizontal(N),
	!.

whiteRow(N, C, [H | T]) :-
	line(N, H, white),
	line(N, H, white),
	horizontal(N),
	NewC is C + 1,
	blackRow(N, NewC, T).

blackRow(N, N, [H | _]) :-
	line(N, H, black),
	line(N, H, black),
	horizontal(N),
	!.

blackRow(N, C, [H | T]) :-
	line(N, H, black),
	line(N, H, black),
	horizontal(N),
	NewC is C + 1,
	whiteRow(N, NewC, T).

line(N, H, Color) :-
	write("|"),
	line(N, 1, H, Color).

line(N, N, H, white) :-
	(N = H -> write(" ### |") ; write("     |")),
	nl,
	!.

line(N, C, H, white) :-
	(C = H -> write(" ### |") ; write("     |")),
	NewC is C + 1,
	line(N, NewC, H, black).

line(N, N, H, black) :-
	(
		N = H -> write(":###:|") ; write(":::::|")
	),
	nl,
	!.

line(N, C, H, black) :-
	(
		C = H -> write(":###:|") ; write(":::::|")
	),
	NewC is C + 1,
	line(N, NewC, H, white).


hetmany(N, P) :-
	numlist(1, N, L),
	permutation(L, P),
	dobra(P).

dobra(P) :-
	\+ zla(P).

zla(P) :-
	append(_, [Wi | L1], P),
	append(L2, [Wj | _], L1),
	length(L2, K),
	abs(Wi - Wj) =:= K + 1.