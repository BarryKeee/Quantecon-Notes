function [out1, out2, out3] = asset_pricing(flag,s,x,ep,e,beta, dbar, gamma, delta)
n = length(s);
switch flag
case 'b'
out1 = zeros(n,1)-inf;
out2 = zeros(n,1)+inf;
case 'f'
u = s.^(-beta);
out1 = x.*u - delta*ep;
out2 = u;
out3 = zeros(n,1)-delta;
case 'g'
out1 = dbar+gamma*(s-dbar)+e;
out2 = zeros(n,1);
case 'h'
u = s.^(-beta);
out1 = u.*(s+x);
out2 = u;
out3 = (-beta)*x.*s.^(-beta-1)+u;
end