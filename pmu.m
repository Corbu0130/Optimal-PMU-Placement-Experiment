clear
clc

pkg load communications;
ieee7bus;

%Integer Linear Linear Programming
fprintf("\nOctave Integer Linear Programming\n");
tic;
x1 = glpk(c,A,b,lb,ub,ctype,vartype,sense)';
f = sum(x1)
toc;

##%Greedy Algorithm
##x2 = greedy(A,b,ctype)';
##f = sum(x2)

%Exhaustive Search
x3 = exhaustive(A,b,ctype);
f = min(sum(x3,2))

%My Greedy OPP algorithm
x4 = pmu_v2(A);
f = sum(x4)