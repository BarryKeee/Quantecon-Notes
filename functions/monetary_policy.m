function [out1, out2, out3] = monetary_policy(flag, s, x, e, alpha, beta, gamma, omega,starget);
[n ds] = size(s);
switch flag
case 'b'
out1 = zeros(n,1);
out2 = inf*ones(n,1);
case 'f'
starget = starget(ones(n,1),:);
out1 = -0.5*((s-starget).^2)*omega';
out2 = zeros(n,1);
out3 = zeros(n,1);
case 'g'
out1 = alpha(ones(n,1),:)+s*beta'+x*gamma+e;
out2 = gamma(ones(n,1),:);
out3 = zeros(n,ds);
end