first --> [].
first --> [a], first, [b].

a(0) --> [].
a(succ(Count)) --> [a], a(Count).

b(0) --> [].
b(succ(Count)) --> [b], b(Count).

c(0) --> [].
c(succ(Count)) --> [c], c(Count).

second --> a(Count), b(Count), c(Count).

fibB(0) --> [].
fibB(succ(0)) --> [b].
fibB(succ(succ(Count))) --> fibB(Count), fibB(succ(Count)).

third --> a(Count), fibB(Count).


p([]) --> [].
p([X|XS]) --> [X], p(XS).