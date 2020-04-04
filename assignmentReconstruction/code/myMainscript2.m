%% Reading image

I = im2double(imread('../data/ChestPhantom.png'));
theta = 0:179 ; 
[M, N] = size(I);

%% CT_imageing (2.1)
drho = 2;
dtheta = 1;
A = Radon_matrix(drho, dtheta, M, N);

%% (2.2)

R = A * I(:);
R_noisy = imnoise(R, 'gaussian', 0, 0.02);

%% (2.3)

Rt_I_noisy = reshape(R_noisy, [], 180) ; 
I_noisy = iradon(Rt_I_noisy, theta, 'linear', 'Ram-Lak', 128);
imshow(I_noisy) ; 

%% (2.4)

lambda = 0.1;
I4 = (A'*A + lambda)\A' * R_noisy ; 

%% (2.5)

I_rec = zeros(size(I)); 







