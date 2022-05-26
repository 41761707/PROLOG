think(ID,Left,Right) :-
    with_mutex(print,(format('[~w] ',[ID]),write('Myśli \n'))),
    sleep(1),
    pick_up_right_fork(ID,Left,Right).

pick_up_right_fork(ID,Left,Right) :-
    with_mutex(print,(format('[~w] ',[ID]),write('Chce prawy widelec \n'))),
    mutex_lock(Right),
    with_mutex(print,(format('[~w] ',[ID]),write('Podnosi prawy widelec \n'))),
    pick_up_left_fork(ID,Left,Right).

pick_up_left_fork(ID,Left,Right) :-
    with_mutex(print,(format('[~w] ',[ID]),write('Chce lewy widelec \n'))),
    mutex_lock(Left),
    with_mutex(print,(format('[~w] ',[ID]),write('Podnosi lewy widelec \n'))),
    eat(ID,Left,Right).

eat(ID,Left,Right) :-
    with_mutex(print,(format('[~w] ',[ID]),write('Je \n'))),
    sleep(1),
    put_away_right_fork(ID,Left,Right).

put_away_right_fork(ID,Right,Left) :-
    with_mutex(print,(format('[~w] ',[ID]),write('Odkłada prawy widelec \n'))),
    mutex_unlock(Right),
    put_away_left_fork(ID,Right,Left).

put_away_left_fork(ID,Right,Left) :-
    with_mutex(print,(format('[~w] ',[ID]),write('Odkłada lewy widelec \n'))),
    mutex_unlock(Left),
    think(ID,Left,Right).

init(ID,Left,Right) :-
    think(ID,Left,Right).



filozofowie :-
    mutex_create(Philosopher0),
	mutex_create(Philosopher4),
	thread_create(init(0, Philosopher4, Philosopher0), Thread0, []),
	mutex_create(Philosopher1),
	thread_create(init(1, Philosopher0, Philosopher1), Thread1, []),
	mutex_create(Philosopher2),
	thread_create(init(2, Philosopher1, Philosopher2), Thread2, []),
	mutex_create(Philosopher3),
	thread_create(init(3, Philosopher2, Philosopher3), Thread3, []),
	thread_create(init(4, Philosopher3, Philosopher4), Thread4, []),

    thread_join(Thread0, _),
	thread_join(Thread1, _),
	thread_join(Thread2, _),
	thread_join(Thread3, _),
	thread_join(Thread4, _).

