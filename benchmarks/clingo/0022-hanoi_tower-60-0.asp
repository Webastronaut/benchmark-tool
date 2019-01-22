steps(23).
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
disk(22).
on0(5,1).
on0(6,5).
on0(7,6).
on0(8,7).
on0(9,8).
on0(10,9).
on0(20,10).
on0(21,20).
on0(11,2).
on0(12,11).
on0(13,12).
on0(14,13).
on0(15,14).
on0(22,15).
on0(16,3).
on0(17,16).
on0(18,17).
on0(19,18).
ongoal(5,1).
ongoal(6,5).
ongoal(7,6).
ongoal(8,7).
ongoal(11,2).
ongoal(12,11).
ongoal(13,12).
ongoal(14,13).
ongoal(15,14).
ongoal(16,15).
ongoal(17,16).
ongoal(18,17).
ongoal(19,18).
ongoal(20,19).
ongoal(21,20).
ongoal(22,21).
ongoal(10,3).
ongoal(9,4).
#include <incmode>.
on(0,N1,N) :- on0(N,N1).

#program check(t).
:- on(t,N1,N), N1>=N.

#program step(t).
{ occurs(some_action,t) }.
1 { move(t,N) : disk(N) } 1 :- occurs(some_action,t).

1 { where(t,N) : disk(N) }1 :- occurs(some_action,t).

:- move(t,N), N<5.

:- on(t-1,N,N1), move(t,N).

:- on(t-1,N,N1), where(t,N).

:- move(t,N), move(t-1,N).

on(t,N1,N) :- move(t,N), where(t,N1).
on(t,N,N1) :- on(t-1,N,N1), not move(t,N1).

#program check(t).
:- not on(t,N,N1), ongoal(N1,N), query(t).
:- on(t,N,N1), not ongoal(N1,N), query(t).
