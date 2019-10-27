
var c k;
varexo taui tauc tauk g;
parameters bet gam del alpha A;
bet=.95; 
gam=2; 
del=.2; 
alpha=.33; 
A=1; 


model;
k=A*k(-1)^alpha+(1-del)*k(-1)-c-g;
c^(-gam)=bet*(c(+1)^(-gam))*((1+tauc(-1))/(1+tauc))*((1-taui)*(1-del)/(1-taui(-1))+((1-tauk)/(1-taui(-1)))*alpha*A*k(-1)^(alpha-1));
end;

initval; 
k=1.5; 
c=0.6; 
g = 0.2; 
tauc = 0; 
taui = 0; 
tauk = 0; 
end;
steady; 

endval;
k=1.5;
c=0.4; 
g =0.2; 
tauc =0.2; 
taui =0; 
tauk =0; end;
steady;

shocks;
var tauc; 
periods 1:9; 
values 0; 
end;

simul(periods=100);

co=ys0_(1);
ko = ys0_(2);
go = ex0_(1,1);

rbig0=1/bet;
rbig=c(2:101).^(-gam)./(bet*c(3:102).^(-gam));
rq0=alpha*A*ko^(alpha-1);
rq=alpha*A*k(1:100).^(alpha-1);
wq0=A*ko^alpha-ko*alpha*A*ko^(alpha-1);
wq=A*k(1:100).^alpha-k(1:100).*alpha*A.*k(1:100).^(alpha-1);
//sq0=(1-ex_(1,4))*A*alpha*ko^(alpha-1)+(1-del);
//sq=(1-ex_(1:100,4)')*A*alpha.*k(1:100).^(alpha-1)+(1-del);

figure
subplot(2,3,1)
plot([ko*ones(100,1)  k(1:100) ])
title('k')
subplot(2,3,2)
plot([co*ones(100,1)  c(2:101) ])
title('c')
subplot(2,3,3)
plot([rbig0*ones(100,1) rbig ])
title('R')
subplot(2,3,4)
plot([wq0*ones(100,1) wq ])
title('w/q')
//subplot(2,3,5)
//plot([sq0*ones(100,1) sq ])
//title('s/q')
subplot(2,3,5)
plot([rq0*ones(100,1) rq ])
title('r/q')