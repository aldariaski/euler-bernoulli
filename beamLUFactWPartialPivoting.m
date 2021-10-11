function [L, U] = beamLUFactWPartialPivoting(n)
  A = generateBeamConst(n);
  L = eye(n);
  
  P = eye(n);
  
  for k=1:n-1
    % Mencari baris l (dimana l itu terbesar)
    [m, l] = max(abs(A(k:n, k)));
    % Adjust max indexing
    l += (k - 1);
    
    % Tukar baris l dan baris k
    tmp = A(l, :);
    A(l, :) = A(k, :);
    A(k, :) = tmp;
    
    % Tukar baris-baris P
    tmp = P(l, :);
    P(l, :) = P(k, :);
    P(k, :) = tmp;
    
    % Tukar baris l and baris k dari L
    % Tukar hanya baris yang sudah diproses
    # maintain unit lower triangular property
    tmp = L(l, 1:k-1);
    L(l, 1:k-1) = L(k, 1:k-1);
    L(k, 1:k-1) = tmp;
    
    for i=k+1:n
      % Find m untuk setiap baris i
      L(i, k) = A(i,k)/A(k, k);  
      % Eliminasi baris i+1 .. n
      A(i,:) = A(i,:) - L(i, k) * A(k,:);
    endfor
  endfor

  U = A;

endfunction

#https://www.sciencedirect.com/topics/engineering/lower-triangular-matrix
#Adapted from blog Hocky
