Lboard = 2;
W = 30 / 100;
D = 3 / 100;
E = 1.3 * 10 ^ 10;
I = W * D ^ 3 / 12;
g = 9.81;
F = -480 * W * D * g;
k = F / (E * I);

for n=[10, 20, 40, 80, 100]
  f = ones(n, 1) * (k * (Lboard / n) ^ 4);
  A = generateBeamConst(n);
  
  [L1 U1] = beamLUFactStd(n);
  [L2 U2] = beamLUFactOpt(n);
  [L3 U3] = beamLUFactWPartialPivoting(n);
  
  solStd = solveBeam(L1, U1, f);
  solOpt = solveBeam(L2, U2, f);
  solPivot = solveBeam(L3, U3, f);
  n
  condition_number = cond(A)
  condition_numberLStd = cond(L1)
  condition_numberUStd = cond(U1)
  condition_numberLOpt = cond(L2)
  condition_numberUOpt = cond(U2)
  condition_numberLPivot = cond(L3)
  condition_numberUPivot = cond(U3)
  
  backerr_std = norm(abs(f - A * solStd), 2)
  backerr_opt = norm(abs(f - A * solOpt), 2)
  backerr_pivot = norm(abs(f - A * solPivot), 2)
  display('')
endfor