function out = industry_entry(flag, s,x,e,pibar,gamma,k0,k1)
pi = s(:,1); i = s(:,2);
switch flag
case 'f'
out = pi.*x - k0.*i.*(1-x)-k1.*x.*(1-i);
case 'g'
out = [pibar+gamma*(pi-pibar)+e x];
end