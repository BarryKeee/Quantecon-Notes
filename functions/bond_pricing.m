function out = bond_pricing(flag, S, kappa, alpha, sigma)
n = size(S,1);
switch flag
case 'rho'
out = S;
case 'mu'
out = kappa*(alpha-S);
case 'sigma'
out = sigma*sqrt(S);
case 'delta'
out = [];
case 'V0'
out = ones(n,1);
end