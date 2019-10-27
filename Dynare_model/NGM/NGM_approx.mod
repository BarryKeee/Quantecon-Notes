
periods = 1000;
var c k l z;
varexo e;

parameters beta theta delta alpha tau rho s;

beta = 0.98;
theta = 0.35;
delta = 0.01;
alpha = 0.4;
tau = 2;
rho = 0.95;
s = 0.007;

model;
(c^theta*(1-l)^(1-theta))^(1-tau)/c = beta*((c(+1)^theta*(1-l(+1))^(1-theta))^(1-tau)/c(+1))*(1+alpha*exp(z(-1))*k(-1)^(alpha-1)*l^(1-alpha)-delta);
c = theta/(1-theta)*(1-alpha)*exp(z(-1))*k(-1)^alpha*l^(-alpha)*(1-l);
k = exp(z(-1))*k(-1)^alpha*l^(1-alpha) - c + (1-delta)*k(-1);
z = rho*z(-1)+s*e;
end;

initval;
k = 1;
c = 1;
l = 0.3;
z = 0;
e = 0;
end;

shocks;
var e;
stderr 1;
end;

steady;

stoch_simul(dr_algo = 0, periods = 1000);