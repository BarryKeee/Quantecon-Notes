function [out1, out2, out3] = tech_shock(flag,s,x,q,ae,as,delta_e,delta_s,eta)
n = size(s,1);
ds = 2;
dx = 2;
switch flag
case 'b' %boundary condition of choice variable at different state point
out1 = 0.0001*ones(size(s));
out2 = [s(:,1).^(as).*s(:,2).^(ae) s(:,1).^(as).*s(:,2).^(ae)];
case 'f'
out1 = zeros(n,1);
out2 = zeros(n,dx);
out3 = zeros(n,dx,dx);
out1 = (s(:,1).^as.*s(:,2).^ae - x(:,1) - x(:,2)).^(1-eta)/(1-eta);
out2(:,1) = -(s(:,1).^as.*s(:,2).^ae - x(:,1) - x(:,2)).^(-eta);
out2(:,2) = -(s(:,1).^as.*s(:,2).^ae - x(:,1) - x(:,2)).^(-eta);
out3(:,1,1) = -eta.*(s(:,1).^as.*s(:,2).^ae - x(:,1) - x(:,2)).^(-eta-1);
out3(:,2,1) = -eta.*(s(:,1).^as.*s(:,2).^ae - x(:,1) - x(:,2)).^(-eta-1);
out3(:,1,2) = -eta.*(s(:,1).^as.*s(:,2).^ae - x(:,1) - x(:,2)).^(-eta-1);
out3(:,2,2) = -eta.*(s(:,1).^as.*s(:,2).^ae - x(:,1) - x(:,2)).^(-eta-1);
case 'g'
out1 = zeros(n,ds);
out2 = zeros(n,ds,dx);
out3 = zeros(n,ds,dx,dx);
out1 = [(1-delta_s).*s(:,1) + x(:,1) (1-delta_e).*s(:,2) + q.*x(:,2)];
out2(:,1,1) = ones(n,1);
out2(:,2,2) = q.*ones(n,1);
end