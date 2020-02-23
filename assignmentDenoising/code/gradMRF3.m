function v = gradMRF3(u, gamma)
  up = abs(u) ; 
  v = gamma / ( 1 + (up / gamma));
  if up > u
     v = -v ; 
  end
end