zapalki(K,D,S,M) :-
	generateLarge(D,[],L1),
	generateMedium(S,L1,L2),
	generateSmall(M,L2,L3),
	length(L3,24).


start([1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24]).
large([1,2,3,4,5,6,7,8,9,10,11,12]).
medium([1,2,14,16,23,22,11,12]).
medium([19,20,16,18,8,9,10,11]).
medium([2,3,4,5,24,23,15,13]).
medium([20,21,5,6,7,8,17,15]).
small([1,13,19,12]).
small([2,14,20,13]).
small([3,4,21,14]).
small([19,15,22,11]).
small([20,16,23,15]).
small([21,5,24,16]).
small([22,17,9,10]).
small([23,18,8,17]).
small([24,6,7,8]).

subset([], []).
subset([E|T], [E|NT]):-
  subset(T, NT).
subset([_|T], NT):-
  subset(T, NT).

subset(X,Y,N) :-
	subset(X,Y),
	length(X,N).

generateLarge(D,Subset,Result) :-
	D=1,
	large(LargeSquare),
	union(largeSquare,Subset,Result).

generateLarge(D,Subset,Result) :-
	D=0,
	Result=Subset.

generateMedium(S,Subset,Result) :-
	medium(MediumSquare),
	subset(Squares,MediumSquare,S),
	buildMedium(S,Subset,Squares,Result).

generateMedium(0,Subset,_,Result) :-
	Result = Subset.

generateMedium(S,Subset,[H|T],Result) :-
	union(H,Subset,NewSubset),
	NewS is S-1,
	buildMedium(NewS,NewSubset,T,Result).

