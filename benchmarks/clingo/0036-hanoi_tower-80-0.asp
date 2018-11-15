steps(30).
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
on0(5,1).
on0(6,5).
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
on0(7,4).
on0(8,7).
on0(9,8).
on0(10,9).
ongoal(7,1).
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
ongoal(6,3).
ongoal(9,6).
ongoal(5,4).
ongoal(10,5).
#include <incmode>.

on(0,N1,N) :- on0(N,N1).


#program check(t).
:- t=T, on(T,N1,N), N1>=N.


#program step(t).
{ occurs(some_action,T) } :- T=t.
1 { move(T,N) : disk(N) } 1 :- occurs(some_action,T), T=t.

1 { where(T,N) : disk(N) }1 :- occurs(some_action,T), T=t.

:- move(T,N), N<5, T=t.

:- on(T-1,N,N1), move(T,N), T=t.

:- on(T-1,N,N1), where(T,N), T=t.

:- move(T,N), move(TM1,N), TM1=T-1, T=t.

on(T,N1,N) :- move(T,N), where(T,N1), T=t.
on(T,N,N1) :- T=t,
              on(T-1,N,N1), not move(T,N1).

put(M,N,T) :- move(T,N), where(T,M), T=t.


#program check(t).
:- not on(T,N,N1), ongoal(N1,N), query(T), T=t.
:- on(T,N,N1), not ongoal(N1,N), query(T), T=t.

