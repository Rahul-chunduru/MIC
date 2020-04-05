function e = objective_func(I, A, R, lambda, MRF_func, gamma)

y = A * I(:) - R ; 
e = y' * y + lambda * compute_function(I, MRF_func, gamma);


end