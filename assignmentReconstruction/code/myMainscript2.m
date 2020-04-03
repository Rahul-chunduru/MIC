%% Reading image

I = imread("../data/ChestCT.png");

%% CT_imageing (2.1)
th1 = 0;
th2 = 179;
diff = 1;

th = th1:diff:th2;
R = radon(I, th);
A = Back_projection(R);
imshow(A);

%% (2.2)

R = radon(A, th);
R_noisy = imnoise(R, 'gaussian', 0, 0.02);

%% (2.3)

A_noisy = iradon(R_noisy, th, 'linear', 'Ram-Lak');
