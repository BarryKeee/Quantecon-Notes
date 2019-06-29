
function F = Theta_solve(theta)
    kappa = 0.19; eta = 0.5; b = 0.4; beta = 0.99; delta = 0.02; A = 1; alpha = 0.5; 
    rho = 0.98; sig = 0.002; N = 10;
    [z, t_matrix] = Tauchen(N, sig, rho);
    Z = exp(z);
    for i = 1:N
        F(i) = sum(((1-eta).*(Z- b)-eta*kappa*theta + ((1-eta)*kappa)./(A*theta.^(alpha-1)))*t_matrix(:,i)) - kappa/(beta*(A*theta(i)^(alpha - 1)));
    end