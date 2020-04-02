function I_res = part3_2(I, r_theta)

theta = r_theta:(r_theta + 150) ; 
m = size(I, 1); 

Rt_I = radon(I, theta) ; 
    
% filtered back projection 
I_res = iradon(Rt_I, theta, 'linear', 'ram-lak', m);
   
end