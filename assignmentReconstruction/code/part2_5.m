function I_rec = part2_5(I, I_noisy, R_noisy, A, MRF_func, MRF_gradfunc, lambda, gamma)

I_rec = I_noisy ; 
iter = 0  ; 
step_size = 1;  

e_curr = objective_func(I_rec, A, R_noisy, lambda, MRF_func, gamma); 

while iter < 30

    dI = reshape(2 * A' * ( A * (I_rec(:)) - R_noisy), size(I_rec)) ; 
    dI = dI + lambda * compute_function(I_rec, MRF_gradfunc, gamma);
    I_next = I_rec - step_size * dI; 

    e_next = objective_func(I_next, A, R_noisy, lambda, MRF_func, gamma); 

    if e_next < e_curr
        e_curr = e_next ; 
        step_size = step_size * 1.1 ; 
        I_rec = I_next ; 
    else
        step_size = step_size / 2; 
    end

    iter = iter + 1 ;

end

I_rec = I_rec / max(max(I_rec)) ; 
e = RRMSE(I, I_rec) ; 
display(e) ; 

end