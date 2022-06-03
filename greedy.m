function x = greedy(A,b,ctype)
  %Greedy Algorithm
  fprintf("\nGreedy Algorithm\n");
  tic;
  [m,n] = size(A);
  x = ones(n,1);
  for i=1:n
    x(i,1) = 0;
    cons = prod(A*x>=b);
    if cons<1
      x(i,1) = 1;
    endif
  endfor
  toc;
endfunction
