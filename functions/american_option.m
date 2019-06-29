function out = american_option(flag, s, x, e, K)
switch flag
case 'f';
out = (K-exp(s(:,1))).*x.*(1-s(:,2));
case 'g';
out = [s(:,1)+e s(:,2)|x]; % "|" is binary operator. Google it
end