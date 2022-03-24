%Przy pomocy komendy append dzielimy tablicę L względem elementu E na dwie
%podtablice, z których jedna składa się ze wszystkich elementów na lewo 
%od pierwszego wystąpienia elementu E, a druga na prawo.
%Operację potwrarzamy dla tablicy A1 po czym sprawdzamy, czy w tablicy A2 
%Znajduje się element E- jeśli tak, zwracamy fałsz
%Jeśli nie, to element występował dokładnie dwukrotnie w tablicy

dwukrotnie(E,L) :- 
    append(B1,[E|A1],L), 
    \+ member(E,B1), 
    append(B2,[E|A2],A1), 
    \+ member(E,B2), 
    \+ member(E,A2).