Lboard = 2;
W = 30 / 100;
D = 3 / 100;
E = 1.3 * 10 ^ 10;
I = W * D ^ 3 / 12;
g = 9.81;
F = -480 * W * D * g;
k = F / (E * I);

for n=[6, 8, 10]
  f = ones(n, 1) * (k * (Lboard / n) ^ 4);
  A = generateBeamConst(n);
  [L2 U2] = beamLUFactOpt(n);
  solOpt = solveBeam(L2, U2, f);
  
  n
  condition_number = cond(A)
  err = abs(f - A * solOpt)(n)
  display('')
endfor

for k=1:11
  n = 10 + 2 ^ k
  f = ones(n, 1) * (k * (Lboard / n) ^ 4);
  A = generateBeamConst(n);
  [L2 U2] = beamLUFactOpt(n);
  solOpt = solveBeam(L2, U2, f);
  
  condition_number = cond(A)
  err = abs(f - A * solOpt)(n)
  display('')
endfor