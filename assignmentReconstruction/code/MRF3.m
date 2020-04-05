function v = MRF3(u, gamma)
   u = abs(u) ;  
   v = gamma * u - (gamma ^ 2) * log(1 + u / gamma);    
end