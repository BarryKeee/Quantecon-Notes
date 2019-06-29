function resid = cournot_resid(c, p, alpha, eta, Phi);
    dp = (-1./eta)*p.^(eta+1);
    q = Phi*c;
    resid = p + q.*dp - alpha*sqrt(q) - q.^2;