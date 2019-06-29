function resid = inverse_ex(c, x, Phi)
    resid = 2*exp((Phi*c) -3) - x;