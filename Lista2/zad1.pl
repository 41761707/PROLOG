%konczymy dzialanie gdy tablica sklada sie z jednego elementu, ktory
%nazwiemy elementem srodkowym
srodkowy([X],X).

%rekurencyjnie wykonumey nastepujace dzialania
%usuwamy pierwszy element z listy
%odwracamy cala liste
%usuwamy pierwszy (defacto ostatni) element z listy)
%ow procedura automatycznie zwraca falsz dla parzystych rozwiazan
%ze wzgledu na predykat delete(List1,List2)
%Nalezy zauwazyc, ze dla nieparzystych rozmiarow list element srodkowy
%odwracanie listy nie wplywa na pozycje srodkowego elementu
%wzgledem pozostalych elementow listy
srodkowy(L,X) :-
	delete(L,A),
	reverse(A,B),
	delete(B,C),
	srodkowy(C,X).

%Jesli lista ma jeden element to zostajemy z pusta lista
delete([_],[]).

%usuwanie pierwszego elementu z listy 
delete([E|L], [E|Reminder]) :- 
    delete(L,Reminder).



	
