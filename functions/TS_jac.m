function fjac = TS_jac(f,x)
    
    h = max(abs(x),1)*6.0*1e-6;
    xh1 = x+h;
    xh0 = x-h;
    h = xh1-xh0;
    
    for j =1:length(x)
        xx = x; xx(j) = xh1(j); f1 = feval(f,xx);
        xx(j) = xh0(j); f0 = feval(f,xx);
        fjac(:,j) = (f1-f0)/h(j);
    end