function [L, U] = beamLUFactStd(n)
  A = generateBeamConst(n);
  L = eye(n);
  for k = 1 : n
      L(k + 1 : n, k) = A(k + 1 : n, k) / A(k, k);
      for l = k + 1 : n
          A(l, :) = A(l, :) - L(l, k) * A(k, :);
     end
  end
  U = A;
endfunction
