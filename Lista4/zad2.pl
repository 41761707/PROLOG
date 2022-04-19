rybki(Kto) :-
	riddle(Kto),!.

nextTo(First,Second,List) :-
	nextto(First,Second,List).

nextTo(First,Second,List) :-
	nextto(Second,First,List).

riddle(Kto) :-
	length(Houses,5),
	Houses=[house(_,norweg,_,_,_) | _],
	member(house(czerwony,anglik,_,_,_),Houses),
	nextto(house(zielony,_,_,_,_),house(bialy,_,_,_,_),Houses),
	member(house(_,dunczyk,_,herbata,_),Houses),
	nextTo(house(_,_,_,_,light),house(_,_,koty,_,_),Houses),
	member(house(zolty,_,_,_,cygaro),Houses),
	member(house(_,niemiec,_,_,fajka),Houses),
	Houses=[_,_,house(_,_,_,mleko,_),_,_],
	nextTo(house(_,_,_,_,light),house(_,_,_,woda,_),Houses),
	member(house(_,_,ptaki,_,bezFiltra),Houses),
	member(house(_,szwed,psy,_,_),Houses),
	nextTo(house(_,norweg,_,_,_),house(niebieski,_,_,_,_),Houses),
	nextTo(house(_,_,konie,_,_),house(zolty,_,_,_,_),Houses),
	member(house(_,_,_,piwo,mentolowe),Houses),
	member(house(zielony,_,_,kawa,_),Houses),
	member(house(_,Kto,rybki,_,_),Houses).