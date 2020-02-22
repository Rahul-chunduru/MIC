
%% Q1.

%% Reading images

I = im2double(imread('../data/mri_image_noiseless.png')) ; 
I1 = im2double(imread('../data/mri_image_noise_level_low.png')) ; 
I2 = im2double(imread('../data/mri_image_noise_level_medium.png')) ; 
I3 = im2double(imread('../data/mri_image_noise_level_high.png')) ; 

%% computing RRMSE of given images

e1 = RRMSE(I, I1) ;
e2 = RRMSE(I, I2) ; 
e3 = RRMSE(I, I3) ; 

display(e1) ; 
display(e2) ; 
display(e3) ; 

%% Gradient descent algorithm

IX = I1;

display(RRMSE(I, IX));

step = 0.1; 
alpha = 0.0000001; 
sigma = 4.3e-4 ;

p = compute_function(IX, I1, @guassianN, @MRF1, alpha, sigma); 

for i = 1:10
    dI = compute_function(IX, I1, @guassianGrad, @gradMRF1, alpha, sigma); 
    It = IX - step * dI ;
    IX = It ;
    if p < compute_function(It, I1, @guassianN, @MRF1, alpha, sigma)
         
        step = 1.1 * step ; 
    else
        step = 0.5 * step ; 
    end
end

display(RRMSE(I, IX)); 






