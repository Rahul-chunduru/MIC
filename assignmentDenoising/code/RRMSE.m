%% computes RRMSE between double matrix I1, I2. I1 is to be noiseless image always. 

function e = RRMSE(I1, I2)

e = norm( I1 - I2, 'fro') / norm(I1, 'fro') ;  


end