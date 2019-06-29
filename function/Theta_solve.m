
function F = Theta_solve(b, beta, kappa, eta, delta, A, alpha, rho, sig, N, theta)
    
    [z, t_matrix] = Tauchen(N, sig, rho);
    
    F = zeros(N);
    for i = 1:N
        F(i) = sum(((1-eta)*(z(i) - b)-eta*kappa*theta + ((1-eta)*kappa)./(A*theta.^(alpha-1)))*t_matrix) - kappa/(beta*(A*theta(i)^(alpha - 1)))