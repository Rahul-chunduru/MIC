function I_rec = part2_5(I_noisy, R_noisy, A, MRF_func, MRF_gradfunc)

I_rec = I_noisy ; 
iter = 0  ;
lambda = 0.5 ; 
step_size = 1 ; 
gamma = 0.05; 

e_curr = objective_func(I_rec, A, R_noisy, lambda, MRF_func, gamma); 

while iter < 50

    dI = reshape(2 * A' * ( A * (I_rec(:)) - R_noisy), size(I_rec)) ; 
    dI = dI + lambda * compute_function(I_rec, MRF_gradfunc, gamma);
    I_next = I_rec - step_size * dI; 

    e_next = objective_func(I_next, A, R_noisy, lambda, MRF_func, gamma); 

    if e_next < e_curr
        e_curr = e_next ; 
        step_size = step_size / 2 ; 
        I_rec = I_next ; 
    else
        step_size = step_size * 0.1 ; 
    end

    iter = iter + 1 ;

end


end