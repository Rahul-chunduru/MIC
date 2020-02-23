
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

alpha = 0.0001; 
sigma = 0.0622;  
gamma = 0.1; 
IX = I3;

display(RRMSE(I, IX)); 

I_denoised = gradient_Descent(IX, sigma, alpha, gamma, @MRF1, @gradMRF1); 
I_denoised1 = gradient_Descent(IX, sigma, alpha, gamma, @MRF2, @gradMRF2); 
I_denoised2 = gradient_Descent(IX, sigma, alpha, gamma, @MRF3, @gradMRF3); 

display(RRMSE(I, I_denoised));
display(RRMSE(I, I_denoised1));
display(RRMSE(I, I_denoised2));






