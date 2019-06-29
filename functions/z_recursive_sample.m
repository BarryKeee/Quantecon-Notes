
function z_index = z_recursive_sample(z_index_prev, t_matrix)
    
    dist = t_matrix(z_index_prev,:);
    cdf = cumsum(dist);
    seed = rand;
    z_index = 1;
    for i = 2:length(t_matrix)
        if seed < cdf(i)
            z_index = i;
            break
        end
    end