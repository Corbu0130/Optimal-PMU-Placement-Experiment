function x = pmu_v2(A)
  fprintf("\nMy Greedy OPP Algorithm\n");
  tic;
  [m,n] = size(A);
  %b(find(ctype=="U")) = -b(find(ctype=="U"));
  sol_x = zeros(1,n);
  cons_clear = 0;
  while cons_clear<m
    filter = 1-logical(A*sol_x');
    cons_cov = sum(A.*filter);
    [val,ind] = max(cons_cov);
    sol_x(ind) = 1;
    cons_clear = cons_clear+val;
  endwhile
  toc
  x = sol_x;
  ##cons = logical(prod(A*x4'))
endfunction
