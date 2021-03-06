function [theta, rrmseV] = part3_1(I)

theta = 0:180 ; 
m = size(I, 1);

rrmseV = zeros(size(theta)) ; 

for i = 0:180
    con_angles = i:(i + 150) ; 
    
    Rt_I = radon(I, con_angles) ; 
    
    % filtered back projection 
    I_res = iradon(Rt_I, con_angles, 'linear', 'ram-lak', m);
    
    rrmseV(i + 1) = RRMSE(I, I_res) ;
   
end

end