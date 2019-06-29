
function out = asset_replace(flag, s, x, e, price, kbar, gamma, abar);
k = s(:,1); a = s(:,2);
switch flag
case 'f'
 out = price*(50-2.5*a-0.25*a.^2).*(1-x) + (price*50 - k).*x;
 out(a==abar & x==0)=-inf;

case 'g'
 out(:,1) = kbar + gamma*(k - kbar) + e;
 out(:,2) = min(a+1, 10).*(1-x)+x;
end