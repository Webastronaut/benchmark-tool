steps(44).
time(0).
time(1).
time(2).
time(3).
time(4).
time(5).
time(6).
time(7).
time(8).
time(9).
time(10).
time(11).
time(12).
time(13).
time(14).
time(15).
time(16).
time(17).
time(18).
time(19).
time(20).
time(21).
time(22).
time(23).
time(24).
time(25).
time(26).
time(27).
time(28).
time(29).
time(30).
time(31).
time(32).
time(33).
time(34).
time(35).
time(36).
time(37).
time(38).
time(39).
time(40).
time(41).
time(42).
time(43).
time(44).
disk(1).
disk(2).
disk(3).
disk(4).
disk(5).
disk(6).
disk(7).
disk(8).
disk(9).
disk(10).
disk(11).
disk(12).
disk(13).
disk(14).
disk(15).
disk(16).
disk(17).
disk(18).
disk(19).
disk(20).
disk(21).
on0(7,1).
on0(11,2).
on0(12,11).
on0(13,12).
on0(14,13).
on0(15,14).
on0(16,15).
on0(17,16).
on0(18,17).
on0(19,18).
on0(20,19).
on0(21,20).
on0(8,3).
on0(9,8).
on0(10,9).
on0(5,4).
on0(6,5).
ongoal(16,1).
ongoal(17,16).
ongoal(18,17).
ongoal(19,18).
ongoal(20,19).
ongoal(21,20).
ongoal(12,3).
ongoal(13,12).
ongoal(5,4).
ongoal(6,5).
ongoal(7,6).
ongoal(8,7).
ongoal(9,8).
ongoal(10,9).
ongoal(11,10).
ongoal(14,11).
ongoal(15,14).


#program initial.
on(N1,N) :- on0(N,N1).

#program dynamic.






{ occurs(some_action) }.
1 { move(N) : _disk(N) } 1 :- occurs(some_action).

1 { where(N) : _disk(N) }1 :- occurs(some_action).

:- move(N), N<5.

:- 'on(N,N1), move(N).

:- 'on(N,N1), where(N).

:- move(N), 'move(N).

on(N1,N) :- move(N), where(N1).
on(N,N1) :- 'on(N,N1), not move(N1).

put(M,N) : move(N), where(M).

:- on(N1,N), N1>=N.

#program final.
:- not on(N,N1), _ongoal(N1,N).
:- on(N,N1), not _ongoal(N1,N).

