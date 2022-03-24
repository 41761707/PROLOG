arc(a,b).
arc(b,a).
arc(b,c).
arc(c,d).


%Wierzcholek jest osiagalny jesli istnieje droga, ktora da sie do niego dojsc
%Z wierzcholka startowego
osiagalny(X,Y) :-
	droga(X,Y,[]).

%Startujac z wierzcholka A wierzcholek A jest osiagalny (z tresci zadania)
droga(A,B,[]) :-
	A=B.


%Droga miedzy wierzcholkami A i B istnieje wtedy, gdy:
%Rekurencyjnie mozemy przechodzic po wierzcholkach X tak dlugo
%Az nie znajduja sie w tablicy odwiedzonych wierzcholkow
%W grafie wystepuja petle, wiec musimy pamietac odwiedzone wierzcholki
%oraz X jest juz koncowym wierzcholkiem, jesli nie, to podrozujemy dalej
droga(A,B,V) :-      
  arc(A,X),        
  \+ member(X,V), 
  ( B=X ; droga(X,B,[A|V]) ).                 