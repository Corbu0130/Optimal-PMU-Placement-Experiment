A = [A;1-x1];
b = [b;1];
ctype = [ctype;"L"];
x1 = glpk(c,A,b,lb,ub,ctype,vartype,sense)'
f = sum(x1)

##A = [A;1-x2];
##b = [b;1];
##x2 = greedy(A,b)';
##f = min(sum(x2))

##A = [A;1-x3];
##[r,l] = size(x3);
##b = [b;ones(r,1)];
##x3 = exhaustive(A,b,ctype)
##f = min(sum(x3,2))

##A = [A;1-x4];
##x4 = pmu_v2(A);
##f = min(sum(x4,2))