function [Z] = exactSolver(V)
  [n] = size(V)
  Z = zeros(n,1)
  
  L = 2;
  W = 30 / 100;
  D = 3 / 100;
  E = 1.3 * 10 ^ 10;
  I = W * D ^ 3 / 12;
  g = 9.81;
  F = -480 * W * D * g;
  K = F / (24 * E * I);
  
  for i=1:n
    x = V(i,1);
    y = K * x^2 * (x^2 - (4 * L * x) + (6 * L^2));
    Z(i,1) = y
  endfor
endfunction
