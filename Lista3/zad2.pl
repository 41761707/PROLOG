
recursive([],S,S,_).

recursive([H|T],S,Result,Current) :-
	(Current>0 -> NewCurrent is Current+H ; NewCurrent is H),
	(NewCurrent>Result -> NewResult is NewCurrent ; NewResult is Result),
	recursive(T,S,NewResult,NewCurrent).

max_sum([],0).

max_sum(L,S):-
	recursive(L,S,0,0).

