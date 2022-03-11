mezczyzna(korneliusz).
mezczyzna(leszek).
mezczyzna(mariusz).
mezczyzna(kacper).
mezczyzna(wieslaw).
mezczyzna(andrzej).
mezczyzna(radek).
mezczyzna(henryk).
mezczyzna(lukasz).
mezczyzna(mateusz).

kobieta(roksana).
kobieta(justyna).
kobieta(nina).
kobieta(lena).
kobieta(wieslawa).
kobieta(sylwia).
kobieta(ada).
kobieta(lucjana).
kobieta(elzbieta).

ojciec(leszek,korneliusz).
ojciec(mariusz,kacper).
ojciec(mariusz,nina).
ojciec(mariusz,lena).
ojciec(wieslaw,leszek).
ojciec(wieslaw,mariusz).
ojciec(wieslaw,andrzej).
ojciec(andrzej,radek).
ojciec(andrzej,ada).
ojciec(henryk,sylwia).
ojciec(henryk,elzbieta).
ojciec(lukasz,mateusz).

matka(roksana,korneliusz).
matka(justyna,kacper).
matka(justyna,nina).
matka(justyna,lena).
matka(wieslawa,leszek).
matka(wieslawa,mariusz).
matka(wieslawa,andrzej).
matka(sylwia,radek).
matka(sylwia,ada).
matka(lucjana,sylwia).
matka(lucjana,elzbieta).
matka(elzbieta,mateusz).

rodzic(leszek,korneliusz).
rodzic(roksana,korneliusz).
rodzic(mariusz,kacper).
rodzic(justyna,kacper).
rodzic(mariusz,nina).
rodzic(justyna,nina).
rodzic(mariusz,lena).
rodzic(justyna,lena).
rodzic(wieslaw,leszek).
rodzic(wieslawa,leszek).
rodzic(wieslawa,mariusz).
rodzic(wieslaw,mariusz).
rodzic(wieslaw,andrzej).
rodzic(wieslawa,andrzej).
rodzic(andrzej,radek).
rodzic(sylwia,radek).
rodzic(andrzej,ada).
rodzic(sylwia,ada).
rodzic(henryk,sylwia).
rodzic(lucjana,sylwia).
rodzic(henryk,elzbieta).
rodzic(lucjana,sylwia).
rodzic(elzbieta,mateusz).
rodzic(lukasz,mateusz).

%jest_matka(X) :- kobieta(X), rodzic(X,_).
jest_matka(X) :- matka(X,_).
jest_ojcem(X) :- ojciec(X,_).
jest_synem(X) :- mezczyzna(X), rodzic(_,X).
dziadek(X,Y) :- mezczyzna(X), ojciec(X,Z), rodzic(Z,Y).
rodzenstwo(X,Y) :- ojciec(A,X), ojciec(A,Y), matka(B,X), matka(B,Y), X\=Y.
siostra(X,Y) :- kobieta(X), rodzenstwo(X,Y).
%jest_ojcem(X) :- mezczyzna(X), rodzic(X,_).