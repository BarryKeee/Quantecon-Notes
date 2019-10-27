
periods 500;
var s N P W;
varexo e_s e_d;
parameters a0 a1 delta d0 d1 bet k;
a0=10;
a1=1;
d0=1000;
d1=1;
bet=.99;
delta=.02;
model(linear);
s=a0+a1*P+e_s; // flow supply of new entrants
N=(1-delta)*N(-1) + s(-4); // evolution of the stock
N=d0-d1*W+e_d; // stock demand equation
P=bet*(1-delta)*P(+1)+bet^4*(1-delta)^4*W(+4); // present value of
//wages

end;
initval;
s=0;
N=0;
P=0;
W=0;
end;
shocks;
var e_d;
stderr 1;
var e_s;
stderr 1;
end;
steady;
check;
stoch_simul(dr_algo=0, order=1, periods=500, irf=10);