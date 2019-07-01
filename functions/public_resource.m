function [out1, out2, out3] = public_resource(flag, s,x,e,alpha, beta, gamma, k)
switch flag
case 'b'
out1 = zeros(size(s));
out2 = s;
case 'f'
out1 = (x.^(1-gamma))/(1-gamma)-k*x;
out2 = x.^(-gamma)-k;
out3 = -gamma*x.^(-gamma-1);
case 'g'
out1 = alpha*(s-x)-0.5*beta*(s-x).^2;
out2 = -alpha+beta*(s-x);
out3 = zeros(size(s)) - beta;
end