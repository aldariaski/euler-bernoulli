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
  
  [L1 U1] = beamLUFactStd(n);
  [L2 U2] = beamLUFactOpt(n);
  [L3 U3] = beamLUFactWPartialPivoting(n);
  
  n
  solution_Std = solveBeam(L1, U1, f)
  solution_Opt = solveBeam(L2, U2, f)
  solution_WPPivot = beamLUFactWPartialPivoting(L3, U3, f)
  display('')
endfor