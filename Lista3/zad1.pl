sum_list([],0).

sum_list([H|T],S) :-
	sum_list(T,Tmp),
	S is H + Tmp.


average(L,A,Len) :-
	sum_list(L,S),
	length(L,Len),
	Len>0,
	A is S/Len.


iterate([],_,0).

iterate([H|T],A,R) :-
	iterate(T,A,Rest),
	R is (H-A)*(H-A) + Rest.

wariancja(L,D) :-
	average(L,A,Len),
	iterate(L,A,R),
	D is R/Len.