key(read).
key(write).
key(if).
key(then).
key(else).
key(fi).
key(while).
key(do).
key(od).
key(and).
key(or).
key(mod).

sep(';').
sep('+').
sep('-').
sep('*').
sep('/').
sep('(').
sep(')').
sep('<').
sep('>').
sep('=<').
sep('>=').
sep(':=').
sep('=').
sep('/=').

scanner(Strumien,Tokeny) :-
    readFile(Strumien,[],List),
    reverse(List,Tokeny).

readFile(Strumien,List1,List2) :-
    get_char(Strumien,X),
    readFile(Strumien,X,List1,List2).

%mala litera- prawdopodobnie klucz
%duza litera- prawdopodobnie ID
%liczba- prawdopodobnie int
%spacja- czytaj dalej

readFile(Strumien,X,List1,List2) :-
    char_type(X,lower),
    readKey(Strumien,X,List1,List2).

readFile(Strumien,X,List1,List2) :-
    char_type(X,upper),
    readID(Strumien,X,List1,List2).

readFile(Strumien,X,List1,List2) :-
    char_type(X,digit),
    readInt(Strumien,X,List1,List2).

readFile(Strumien,X,List1,List2) :-
    char_type(X,space),
    readFile(Strumien,List1,List2).

%teraz separatory
readFile(Strumien,X,List1,List2) :-
    member(X,[';','+','-','*','(',')','<']),
    append([sep(X)],List1,NewList1),
    readFile(Strumien,NewList1,List2).

readFile(Strumien,X,List1,List2) :-
    member(X,[':','=','>','/']),
    readSep(Strumien,X,List1,List2).

%EOF
readFile(_,X,List1,List2) :-
    char_type(X,end_of_file),
    List2=List1.


readKey(Strumien,X,List1,List2) :-
    get_char(Strumien,Y),
    readKey(Strumien,X,Y,List1,List2).

readKey(_,X,end_of_file,List1,List2) :-
    key(X),
    append([key(X),List1,NewList1]),
    List2=NewList1, !.

readKey(Strumien,X,Y,List1,List2) :-
    member(Y,[';', '+', '-', '*', '(', ')', '<']),
    append([sep(Y),key(X)],List1,NewList1),
    readFile(Strumien,NewList1,List2).

readKey(Strumien,X,Y,List1,List2) :-
    member(Y,[':', '=', '>', '/']),
    append([key(X)],List1,NewList1),
    readSep(Strumien,X,NewList1,List2).


readKey(Strumien,X,Y,List1,List2) :-
    char_type(Y,space),
    key(X),
    append([key(X)],List1,NewList1),
    readFile(Strumien,NewList1,List2).

readKey(Strumien,X,Y,List1,List2) :-
    char_type(Y,lower),
    get_char(Strumien,C),
    atom_concat(X,Y,NewX),
    readKey(Strumien,NewX,C,List1,List2).

readInt(Strumien,X,List1,List2) :-
    get_char(Strumien,Y),
    readInt(Strumien,X,Y,List1,List2).

readInt(_,X,end_of_file,List1,List2) :-
    append([int(X)],List1,NewList1),
    List2=NewList1, !.

readInt(Strumien,X,Y,List1,List2) :-
    char_type(Y,space),
    append([int(X)],List1,NewList1),
    readFile(Strumien,NewList1,List2).

readInt(Strumien,X,Y,List1,List2) :-
    char_type(Y,digit),
    get_char(Strumien,C),
    atom_concat(X,Y,NewX),
    readInt(Strumien,NewX,C,List1,List2).

readInt(Strumien,X,Y,List1,List2) :-
    member(Y,[';', '+', '-', '*', '(', ')', '<']),
    append([sep(Y),int(X)],List1,NewList1),
    readFile(Strumien,NewList1,List2).

readInt(Strumien,X,Y,List1,List2) :-
    member(Y,[':', '=', '>', '/']),
    append([int(X)],List1,NewList1),
    readSep(Strumien,X,NewList1,List2).

readID(Strumien,X,List1,List2) :-
    get_char(Strumien,Y),
    readID(Strumien,X,Y,List1,List2).

readID(_,X,end_of_file,List1,List2) :-
    append([id(X)],List1,NewList1),
    List2=NewList1, !.

readID(Strumien,X,Y,List1,List2) :-
    char_type(Y,space),
    append([id(X)],List1,NewList1),
    readFile(Strumien,NewList1,List2).

readID(Strumien,X,Y,List1,List2) :-
    char_type(Y,upper),
    get_char(Strumien,C),
    atom_concat(X,Y,NewX),
    readID(Strumien,NewX,C,List1,List2).

readID(Strumien,X,Y,List1,List2) :-
    member(Y,[';', '+', '-', '*', '(', ')', '<']),
    append([sep(Y),id(X)],List1,NewList1),
    readFile(Strumien,NewList1,List2).

readID(Strumien,X,Y,List1,List2) :-
    member(Y,[':', '=', '>', '/']),
    append([id(X)],List1,NewList1),
    readSep(Strumien,X,NewList1,List2).


readSep(Strumien,X,List1,List2) :-
    get_char(Strumien, Y),
	atom_concat(X, Y, Concat),
	(
		sep(Concat) -> 
			(
				append([sep(Concat)], List1, NewList1),
				readFile(Strumien, NewList1, List2)
			)
			;
			(
				sep(X),
				append([sep(X)], List1, NewList1),
				readFile(Strumien, Y, NewList1, List2)
			)
	).