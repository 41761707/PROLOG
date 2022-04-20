zapalki(K,D,S,M) :-
	generateLarge(D, [], L1),
	generateMedium(S, L1, L2),
	generateSmall(M, L2, L3),
	length(L3, Amount),
	K is 24 - Amount,
	buildLarge(D, L3),
	buildMedium(S, L3),
	buildSmall(M, L3),
	show(L3).

start([1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24]).
large([1, 2, 3, 4, 7, 11, 14, 18, 21, 22, 23, 24]).
medium([[1, 2, 4, 6, 11, 13, 15, 16], [2, 3, 5, 7, 12, 14, 16, 17], [8, 9, 11, 13, 18, 20, 22, 23], [9, 10, 12, 14, 19, 21, 23, 24]]).
small([[1, 4, 5, 8], [2, 5, 6, 9], [3, 6, 7, 10], [8, 11, 12, 15], [9, 12, 13, 16], [10, 13, 14, 17], [15, 18, 19, 22], [16, 19, 20, 23], [17, 20, 21, 24]]).

subset([], _).
subset([H | T1], [H | T2]) :- subset(T1, T2).
subset([H | T1], [_ | T2]) :- subset([H | T1], T2).

subset(X, Y, N) :-
	subset(X, Y),
	length(X, N).

generateLarge(D, List, Result) :-
	D = 1,
	large(LargeSquare),
	union(LargeSquare, List, Result).

generateLarge(D, List, Result) :-
	D = 0,
	Result = List.

generateMedium(S, List, Result) :-
	medium(MediumSquare),
	subset(Squares, MediumSquare, S),
	generateMedium(S, List, Squares, Result).

generateMedium(0, List, _, Result) :-
	Result = List.
generateMedium(S, List, [H | T], Result) :-
	union(H, List, NewList),
	NewS is S-1,
	generateMedium(NewS, NewList, T, Result).

generateSmall(M, List, Result) :-
	small(SmallSquare),
	subset(Squares, SmallSquare, M),
	generateSmall(M, List, Squares, Result).

generateSmall(0, List, _, Result) :-
	Result = List.
generateSmall(M, List, [H | T], Result) :-
	union(H, List, NewList),
	NewM is M - 1,
	generateSmall(NewM, NewList, T, Result).

show(List) :-
	start(StartSquare),
	show(StartSquare, List).

show([], _) :- !.

show([H | T], List) :-
	member(H, [2, 3, 9, 10, 16, 17, 23, 24]),
	(
		member(H, List) -> write('---+') ; write('   +')
	),
	show(T, List).

show([H | T], List) :-
	member(H, [1, 8, 15, 22]),
	(
		member(H, List) -> nl, write('+---+') ; nl, write('+   +')
	),
	show(T, List).

show([H | T], List) :-
	member(H, [5, 6, 7, 12, 13, 14, 19, 20, 21]),
	(
		member(H, List) -> write('|   ') ; write('    ')
	),
	show(T, List).

show([H | T], List) :-
	member(H, [4, 11, 18]),
	(
		member(H, List) -> nl, write('|   ') ; nl, write('    ')
	),
	show(T, List).


buildLarge(1, List) :-
	intersection(List, [1, 2, 3, 4, 7, 11, 14, 18, 21, 22, 23, 24], X),
	length(X, N),
	N =:= 12.

buildLarge(0, List) :-
	intersection(List, [1, 2, 3, 4, 7, 11, 14, 18, 21, 22, 23, 24], X),
	length(X, N),
	N =\= 12.

buildMedium(_, _, Counter, [], Result) :-
	Result is Counter.
buildMedium(Amount, List, Counter, [H | T], Result) :-
	(
		(
			intersection(List, H, X),
			length(X, N),
			N =:= 8
		) ->
		(
			NewCounter is Counter + 1,
			NewCounter =< Amount,
			buildMedium(Amount, List, NewCounter, T, Result)
		)
		;
		(
			Counter =< Amount,
			buildMedium(Amount, List, Counter, T, Result)
		)
	).

buildMedium(S, List) :-
	buildMedium(S, List, 0, [[1, 2, 4, 6, 11, 13, 15, 16], [2, 3, 5, 7, 12, 14, 16, 17], [8, 9, 11, 13, 18, 20, 22, 23], [9, 10, 12, 14, 19, 21, 23, 24]], Counter),
	S is Counter.

buildSmall(_, _, Counter, [], Result) :-
	Result is Counter.
buildSmall(Amount, List, Counter, [H | T], Result) :-
	(
		(
			intersection(List, H, X),
			length(X, N),
			N =:= 4
		) ->
		(
			NewCounter is Counter + 1,
			NewCounter =< Amount,
			buildSmall(Amount, List, NewCounter, T, Result)
		)
		;
		(
			Counter =< Amount,
			buildSmall(Amount, List, Counter, T, Result)
		)
	).

buildSmall(M, List) :-
	buildSmall(M, List, 0, [[1, 4, 5, 8], [2, 5, 6, 9], [3, 6, 7, 10], [8, 11, 12, 15], [9, 12, 13, 16], [10, 13, 14, 17], [15, 18, 19, 22], [16, 19, 20, 23], [17, 20, 21, 24]], Counter),
	M is Counter.