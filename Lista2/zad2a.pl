%Korzystając z procedury select tworzę dodatkową listę R, w której przechowuję
%listę X pozbawioną elementu L.
%Jeśli element L ma występować jednokrotnie to po operacji select 
%nie powinien być elementem listy R.
jednokrotnie(X,L) :-
	select(X,L,R),
	\+ member(X,R).