wyrazenie(List, Value, Expression) :-
	resultMaker(List, Expression),
	Value is Expression.

resultMaker([H], H).
resultMaker(List, X) :-
	List1=[_|_],
	List2=[_|_],
	append(List1, List2, List),
	resultMaker(List1, Z),
	resultMaker(List2, Y),
	operation(X,Y,Z).


operation(X,Y,Z) :-
	X=(Z+Y).

operation(X,Y,Z) :-
	X=Z-Y.

operation(X,Y,Z) :-
	X=Z*Y.

operation(X,Y,Z) :-
	\+(0 is Y),
	\+(0.0 is Y),
	X=Z/Y.
