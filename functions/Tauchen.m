
function [y,t_matrix] = Tauchen(N, sig, rho)
    m = 3;
    y_N = m*sqrt(sig^2/(1-rho^2));
    y = linspace(-y_N, y_N, N);
    
    d = y(2) - y(1);
    
    t_matrix = zeros(N,N);
    for j = 1:N
        for k = 1:N
            if k == 1
                t_matrix(j,k) = normcdf((y(1) + d/2-rho*y(j))/sig);
            elseif k == N
                t_matrix(j,k) = 1 - normcdf((y(N) - d/2 - rho*y(j))/sig);
            else
                t_matrix(j,k) = normcdf((y(k) + d/2 - rho*y(j))/sig) - normcdf((y(k) - d/2 - rho*y(j))/sig);
            end
        end
    end