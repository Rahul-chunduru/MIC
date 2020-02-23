
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

% display(e1); display(e2); display(e3);

%% Gradient descent algorithm

alpha = 0.003; 
sigma = 0.0525;  
gamma = 0.01 ; 
IX = I1;

display(RRMSE(I, IX)); 

I_denoised = gradient_Descent(IX, sigma, alpha, gamma); 

display(RRMSE(I, I_denoised)); 






