function [out1,out2,out3] = optimal_growth(flag,s,x,e,alpha,beta,gamma)
switch flag
case 'b'
out1 = zeros(size(s));
out2 = s;
case 'f'
out1 = ((s-x).^(1-alpha))/(1-alpha);
out2 = -(s-x).^(-alpha);
out3 = -alpha*(s-x).^(-alpha-1);
case 'g'
out1 = gamma*x + e.*x.^beta;
out2 = gamma+beta*e.*x.^(beta-1);
out3 = (beta-1)*beta*e.*x.^(beta-2);
end