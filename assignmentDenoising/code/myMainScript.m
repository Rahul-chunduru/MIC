
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

IX = I2;
IY = I2 ; 

display(RRMSE(I, IX));

step = 0.018; 
alpha = 0.03; 
sigma = 0.0525;

p = sum(sum(compute_function(IX, IY, @guassianN, @MRF1, alpha, sigma))); 

for i = 1:30
    dI = compute_function(IX, IY, @guassianGrad, @gradMRF1, alpha, sigma); 
    It = IX - step * dI ;
    if p > sum(sum(compute_function(It, IY, @guassianN, @MRF1, alpha, sigma)))         
        step = 1.1 * step ;
        IX = It; 
    else
        step = 0.5 * step ; 
    end
end

display(RRMSE(I, IX)); 






