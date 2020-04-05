%% Reading image

I = im2double(imread('../data/ChestPhantom.png'));
[M, N] = size(I);

%% CT_imageing (2.1)
drho = 2;
dtheta = 1;
th = 0 : dtheta : 180-dtheta ;
A = Radon_matrix(drho, dtheta, M, N);

%% (2.2)

R = A*I(:);
[R_m, ~] = size(R);
noise = (0.02)*(max(R) - min(R))*randn(size(R));
R_noisy_row = R + noise;
R_noisy = reshape(R_noisy_row, R_m/180, 180);
R_noisy = flip(R_noisy);

%% (2.3)

I_noisy = iradon(R_noisy, th, 'linear', 'Ram-Lak', 128);
I_noisy = I_noisy / max(max(I_noisy)) ; 

% plot
figure;
title(
imshow(I_noisy, []);
% rrmse values
e1 = RRMSE(I, I_noisy) ; 


%% (2.4)

alpha = 1; 
eps = 0.0001;
% I4 = inv((A'*A + lambda))*(A'*R_noisy);
b = R_noisy(:);
I4 = gradient_descent_L2(A, b, alpha, eps, M*N, 1);

%%

I4 = reshape(I4, M, N);
I4 = flip(I4);
e = RRMSE(I4,I) ; 
figure; 
imshow(I4, []);
% e = RRMSE(I4, I)
% imshow(I4)

%% (2.5)

% I_rec = part2_5(zeros(size(I)), R_noisy_row, A, @MRF1, @gradMRF1);
I_rec = I_noisy ; 

% Image from prior-iterative reconstruction. 

% squared 
I_rec1 = part2_5(zeros(size(I)), R_noisy_row, A, @MRF1, @gradMRF1);
% huber
I_rec2 = part2_5(zeros(size(I)), R_noisy_row, A, @MRF1, @gradMRF1);
% Discontinuity adaptive
I_rec3 = part2_5(zeros(size(I)), R_noisy_row, A, @MRF1, @gradMRF1);


imshow(I_rec, []); 

% RRMSE values

% Squared loss, parameters :- lambda 
% RRMSE = 0.8425






