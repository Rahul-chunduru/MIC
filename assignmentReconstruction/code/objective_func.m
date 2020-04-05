function e = objective_func(I, A, R, lambda, MRF_func, gamma)

y = A * I(:) - R ; 
e = y' * y + lambda * sum(sum(compute_function(I, MRF_func, gamma)));


end