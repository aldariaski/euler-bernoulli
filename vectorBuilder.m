function [V] = vectorBuilder(n)
  V = zeros(n,1);
  diff = 2/n;
  for i=1:n
    V(i,1) = diff * i;
  endfor
endfunction
