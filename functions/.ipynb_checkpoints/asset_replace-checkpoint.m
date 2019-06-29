
function out = asset_replace(flag, s, x, e, price, kbar, gamma);
switch flag
case 'f';
 out = price*(100-5*s(:,2)-0.5*s(:,2).^2).*(1-x) + (price*100 - s(:,1)).*x;
case 'g';
 out(:,1) = kbar + gamma*(s(:,1) - kbar) + e;
 out(:,2) = min(s(:,2)+1, 10).*(1-x)+x;
end