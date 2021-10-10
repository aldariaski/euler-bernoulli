Lboard = 2;
W = 30 / 100;
D = 3 / 100;
E = 1.3 * 10 ^ 10;
I = W * D ^ 3 / 12;
g = 9.81;
F = -480 * W * D * g;
k = F / (E * I);

for n=[40, 160, 640, 2560]
  f = ones(n, 1) * (k * (Lboard / n) ^ 4);
  A = generateBeamConst(n);
  
  [L1 U1] = beamLUFactStd(n);
  [L2 U2] = beamLUFactOpt(n);
  
  solStd = solveBeam(L1, U1, f);
  solOpt = solveBeam(L2, U2, f);
  
  n
  condition_number = cond(A)
  backerr_std = norm(abs(f - A * solStd), 2)
  backerr_opt = norm(abs(f - A * solOpt), 2)
  display('')
endfor