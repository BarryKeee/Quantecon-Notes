function out = timber_cutting(flag, s, x, e, price, C, K, alpha)
switch flag
case 'f'
out = (price*s - C).*x;
case 'g';
out  =((K+exp(-alpha)*(s-K))).*(1-x);
end