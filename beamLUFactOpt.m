function [L,U] = beamLUFactOpt(n)
  A = generateBeamConst(n);
  L = eye(n);
  for i = 1:n-1
    akhir_row = i + 2;
    if (i >= n - 3)
      akhir_row = n;
    endif
    for j = i+1:akhir_row
      L(j,i) = A(j,i)/A(i,i);  
      S = max(j - 3, 1);
      E = min(j + 3, n);
      A(j,S:E) = A(j,S:E) - L(j,i)*A(i,S:E);
    endfor
  endfor
  U = triu(A);
endfunction