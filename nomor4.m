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
  [yApprox] = solveBeam(L1, U1, f);
  
  [V] = vectorBuilder(n);
  [yExact] = exactSolver(V);
  
  error = abs(yApprox(n,1) - yExact(n,1));
  plot(yApprox, yExact);
  n,error
  display('')
endfor