function x = exhaustive(A,b)
  ##%Exhaustive Search
  fprintf("\nExhaustive Search or Brute Search\n");
  [m,n] = size(A);
  k = 2^n-1;
  %xk = de2bi(1:k,n)
  prevfx = n;
  prevx = de2bi(k,n)';
  tic;
  i = 1;
  for i=1:k
    x = de2bi(i,n);
    cons = prod(A*x'>=b);
    fx = sum(x);
    if cons>=1
      if fx==prevfx
        prevx = [prevx;x];
      elseif fx<prevfx
        prevfx = fx;
        prevx = x;
      endif
    endif
  endfor
  x = prevx;
  toc;
endfunction
