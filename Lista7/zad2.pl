split(IN,OUT1,OUT2) :-
    split(IN,OUT1,0,OUT2,0).

split(IN,OUT1,COUNT1,OUT2,COUNT2) :-
    freeze(IN,
        ( IN = [H|T] ->
            (
                (COUNT1>COUNT2) -> NEWCOUNT2 is COUNT2+1,
                OUT2=[H|Tail],
                split(T,OUT1,COUNT1,Tail,NEWCOUNT2)
                ;
                NEWCOUNT1 is COUNT1 + 1,
                OUT1=[H|Tail],
                split(T,Tail,NEWCOUNT1,OUT2,COUNT2)
            )
            ;
            (OUT1=[],OUT2=[])
        )
    ).

merge_sort(In,Out) :-
    split(In,List1,List2),
    freeze(List2, (
        List2=[_|_] ->
            freeze(List1, (
                merge_sort(List1,Out1)
            )),
        merge_sort(List2,Out2)
        ;
        Out=List1
    )),
    merge(Out1,Out2,Out).