
function fval = cournot(q)
    c = [0.6;0.8], eta = 1.6;
    e = -1/eta;
    fval = sum(q)^e + e*sum(q)^(e-1)*q - diag(c)*q