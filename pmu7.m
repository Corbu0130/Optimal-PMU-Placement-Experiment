clear
clc

fprintf("IEEE 7-bus test system Optimal PMU Placement\n");
c = ones(7,1);
A = [ 1 1 0 0 0 0 0;
      1 1 1 0 0 1 1;
      0 1 1 1 0 1 0;
      0 0 1 1 1 0 1;
      0 0 0 1 1 0 0;
      0 1 1 0 0 1 0;
      0 1 0 1 0 0 1; ];
b = ones(7,1);
lb = zeros(7,1);
ub = ones(7,1);
ctype = ["L";"L";"L";"L";"L";"L";"L"];
vartype = ["C","C","C","C","C","C","C"];
sense = 1;

%Integer Linear Programming
fprintf("\nOctave Integer Programming\n");
tic;
x = glpk(c,A,b,lb,ub,ctype,vartype,sense)'
toc;

%Exhaustive Search
fprintf("\nExhaustive Search or Brute Search\n");
m = 2^7-1;
solutions = de2bi([1:m],7);
prevx = 7;
tic;
for i=1:m
  x = solutions(i,:)';
  cons = prod(A*x);
  fx = sum(x);
  if cons>=1
    if fx<prevx
      prevfx = fx;
      prevx = x;
    endif
  endif
endfor
x = prevx'
toc;

%Greedy Algorithm
fprintf("\nGreedy Algorithm\n");
x = ones(7,1);
tic;
for i=1:7
  x(i,1) = 0;
  cons = prod(A*x);
  if cons<1
    x(i,1) = 1;
  endif
endfor
x = x'
toc;