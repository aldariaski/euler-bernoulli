function [x] = solveBeam(L, U, b)
  [n n] = size(L);
  tmp = zeros(n, 1);
  tmp(1) = b(1) / L(1,1);
  for i = 2:n
    tmp(i) = (b(i) - L(i, i-1) * tmp(i-1)) / L(i,i);
  endfor

  sol = zeros(n,1);
  sol(n) = tmp(n) / U(n,n);
  for i = n-1:-1:1
    sol(i) = (tmp(i) - U(i, i+1) * sol(i+1)) / U(i,i);
  endfor
  x = sol;
endfunction
