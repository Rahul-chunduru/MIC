function I_denoised = gradient_Descent(IY, sigma, alpha, gamma, V, gV)
 IX = IY; 

 step = 0.01; 

 p = sum(sum(compute_function(IX, IY, @guassianN, V, alpha, sigma, gamma))); 
 improv = 1 ; 
 iter = 1 ; 

 while improv > 1e-3 && step > 1e-6 && iter < 10
    iter = iter + 1 ; 
    dI = compute_function(IX, IY, @guassianGrad, gV, alpha, sigma, gamma); 
    It = IX - step * dI ;
    pt = p - sum(sum(compute_function(It, IY, @guassianN, V, alpha, sigma, gamma))) ; 
    if pt >= 0
        improv = pt/p; 
        step = 1.01 * step ;
        IX = It; 
    else
        step = 0.5 * step ; 
    end
 end
 
 I_denoised = IX ; 
end