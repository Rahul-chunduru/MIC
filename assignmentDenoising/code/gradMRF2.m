function v = gradMRF2(u, gamma)
  up = abs(u) ; 
  if up < gamma
      v = up ; 
  else
      v = gamma ; 
  end
  
  if u < 0 
      v = -v ; 
  end
end