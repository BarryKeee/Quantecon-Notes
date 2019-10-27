function out = VFI_h(x,z,ki,kj,alpha,delta,gamma)
    out = 1/(1-x)*(exp(z)*ki^alpha*x^(1-alpha)+(1-delta)*ki - kj)^gamma-(1-alpha)*exp(z)*ki^alpha*x^(-alpha);