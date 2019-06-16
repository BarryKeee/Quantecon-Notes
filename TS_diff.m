function TS = TS_diff(f,x0)
    
    h = max(abs(x0),1)*6.0*1e-6;
    
    TS = (f(x0+h)-f(x0-h))/(2*h);