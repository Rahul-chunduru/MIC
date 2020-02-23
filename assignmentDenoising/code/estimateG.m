function sigma = estimateG(I, I1)
   [m, n ] = size(I) ; 
   sigma = sqrt( sum(sum((I - I1).^2))/ (m * n));  
end