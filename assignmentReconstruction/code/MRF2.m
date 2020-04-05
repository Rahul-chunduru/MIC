function v = MRF2(u, gamma)
   u = abs(u) ; 
   if u < gamma
      v = 0.5 * u * u ; 
   else
       v = gamma * u  - 0.5 * gamma ^ 2 ; 
   end
end