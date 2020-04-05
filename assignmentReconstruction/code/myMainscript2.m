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
% R_noisy = flip(R_noisy);

%% (2.3)

I_noisy = iradon(R_noisy, th, 'linear', 'Ram-Lak', 128);
I_noisy = I_noisy / max(max(I_noisy)) ; 

% plot
figure;
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

%% (2.5)

% I_rec = part2_5(zeros(size(I)), R_noisy_row, A, @MRF1, @gradMRF1);
I_rec = I_noisy ; 

% Image from prior-iterative reconstruction. 

% squared 
I_rec1 = part2_5(I, I_noisy, R_noisy_row, A, @MRF1, @gradMRF1, 1.2, 0.8);
% huber
I_rec2 = part2_5(I, I_noisy, R_noisy_row, A, @MRF1, @gradMRF1, 1.2, 0.8);
% Discontinuity adaptive
I_rec3 = part2_5(I, I_noisy, R_noisy_row, A, @MRF1, @gradMRF1, 14, 2.6);

figure;
imshow(I_rec1, []); 
title('Squared difference - prior iterative reconstruction');

figure;
imshow(I_rec2, []); 
title('Huber function - prior iterative reconstruction');

figure;
imshow(I_rec3, []); 
title('Adaptive Discontinuous - prior iterative reconstruction');

% RRMSE values

% Squared difference, parameters :- lambda 

% optimal lamda = 1.2,  RRMSE = 0.3073
% lamda = 1.4, RRMSE = 0.3087
% lambda = 1, RRMSE = 0.3087

% Huber Function, parameters :- lambda, gamma
%
% optimal lambda = 1.2, optimal gamma = 0.8
% RRMSE :- 0.3092

% lambda = 1, gamma = 0.6, rrmse = 0.3093
% lambda = 1.4, gamma = 1, rrmse = 0.3095

% Adaptive Discontinuous

% lambda = 14, optimal gamma = 2.6, rrmse = 0.2331
% gamma = 2.4, rrmse = 0.2351
% gamma = 2.8, rrmse = 0.2361









