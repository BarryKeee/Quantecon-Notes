function [out1, out2, out3] = nonrenewable_ore(flag, s,x,e,a,b)
switch flag
case 'b'
out1 = zeros(size(s));
out2 = s;
case 'f';
out1 = (a(1)-a(2).*x).*x/2 - b(1).*x+b(2).*x.*(2*s-x)/2;
out2 = a(1)-a(2).*x - b(1)+b(2)*s-b(2).*x;
out3 = (-a(2)-b(2))*ones(size(s));
case 'g';
out1 = s-x;
out2 = -ones(size(s));
out3 = zeros(size(s));
end