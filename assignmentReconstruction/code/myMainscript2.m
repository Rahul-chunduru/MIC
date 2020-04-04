%% Reading image

I = imread("../data/ChestPhantom.png");
[M, N] = size(I);

%% CT_imageing (2.1)
drho = 5;
dtheta = 1;
A = Radon_matrix(drho, dtheta, M, N);

%% (2.2)

R = A*I(:);
R_noisy = imnoise(R, 'gaussian', 0, 0.02);

%% (2.3)

I_noisy = iradon(R_noisy, th, 'linear', 'Ram-Lak');

%% (2.4)

lambda = 0.1;
I4 = inv((A'*A + lambda)A'*R_noisy

%% (2.5)


