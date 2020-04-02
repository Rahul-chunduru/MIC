%% Q1

%% part (a) 

I = imread('../data/SheppLogan256.png');
theta = 1:3:178;
Rt_I = radon(I, theta);
[output_size, ~] = size(I); 
wmax = 0.5 ; 

I_unfil = iradon(Rt_I, theta, output_size); 

I_ramlak1 = fbt(Rt_I, theta, @ramlak, wmax, output_size);
I_ramlak2 = fbt(Rt_I, theta, @ramlak, wmax/2, output_size);

I_shepplogan1 = fbt(Rt_I, theta, @shepplogan, wmax, output_size);
I_shepplogan2 = fbt(Rt_I, theta, @shepplogan, wmax/2, output_size);

I_cosine1 = fbt(Rt_I, theta, @cosine, wmax, output_size);
I_cosine2 = fbt(Rt_I, theta, @cosine, wmax/2, output_size);

%show images
figure ; 
subplot(4, 2, 1), imshow(I, []); 
title('orignal');
subplot(4, 2, 2), imshow(I_unfil, []);
title('unfiltered');
subplot(4, 2, 3), imshow(I_ramlak1, []);  
title('Ram-Lak - wmax');
subplot(4, 2, 4), imshow(I_ramlak2, []);
title('Ram-Lak - wmax/2');
subplot(4, 2, 5), imshow(I_shepplogan1, []);  
title('Shepp-Logan - wmax');
subplot(4, 2, 6), imshow(I_shepplogan2, []);
title('Shepp-Logan - wmax/2');
subplot(4, 2, 7), imshow(I_cosine1, []);  
title('Cosine - wmax');
subplot(4, 2, 8), imshow(I_cosine2, []);
title('Cosine - wmax');

%% Similarities and Differences of different reconstructed images
% .. 


%% part (b)

S0 = im2double(I) ; 
S1 = im2double(imgaussfilt(I, 1));
S5 = im2double(imgaussfilt(I, 5)); 

Rt_S0 = radon(S0, theta);
Rt_S1 = radon(S1, theta);
Rt_S5 = radon(S5, theta);

% show the three versions of shepp-logan
figure ; 
subplot( 1 ,3 , 1), imshow(S0) ; 
title('Shepp-logan \sigma = 0') ; 
subplot( 1 ,3 , 2), imshow(S1) ; 
title('Shepp-logan \sigma = 1') ; 
subplot( 1 ,3 , 3), imshow(S5) ; 
title('Shepp-logan \sigma = 5') ;

% computing Ramlek-filter back projections. 

R0 = fbt(Rt_S0, theta, @ramlak, wmax, output_size);
R1 = fbt(Rt_S1, theta, @ramlak, wmax, output_size);
R5 = fbt(Rt_S5, theta, @ramlak, wmax, output_size);

% computing their RRMSE with original

e0 = RRMSE(S0, R0); 
e1 = RRMSE(S1, R1); 
e5 = RRMSE(S5, R5); 

display(e0), display(e1), display(e5); 

% The computed RRMSE values are, e0 = 0.5046, e1 = 0.4573, e5 = 0.4114 
% Therefore, e5 < e1 < e0. Hence, it is easier to reconstruct a blury image than a non-blurry image. 
% but why?
%

%%  Part c 

[w, rrmse1] = part1c(S0, Rt_S0, theta); 

figure ; 
plot(w, rrmse1) ; 
title('RRMSE plot vs w - shepp-logan \sigma = 0') ; 
xlabel('frequency \omega') ; 
ylabel('RRMSE value') ; 


[w, rrmse2] = part1c(S1, Rt_S1, theta); 

figure ; 
plot(w, rrmse2) ; 
title('RRMSE plot vs \omega - shepp-logan \sigma = 1') ; 
xlabel('frequency w') ; 
ylabel('RRMSE value') ; 


[w, rrmse3] = part1c(S5, Rt_S5, theta); 

figure ; 
plot(w, rrmse3) ; 
title('RRMSE plot vs \omega - shepp-logan \sigma = 5') ; 
xlabel('frequency \omega') ; 
ylabel('RRMSE value') ; 


% It can be seen that for each image, 
% with increasing L, RRMSE went down exponentially. 
% This is to be expected as L increases, the inverse radon transfrom is
% more accurate. 

%% Q3 - Incomplete data filtering


%%  part (i) 

I_sl = im2double(imread('../data/SheppLogan256.png'));
I_ct = im2double(imread('../data/ChestCT.png'));

[theta, r1] = part3_1(I_sl); 
[~, r2] = part3_1(I_ct); 

% ploting values
figure;
title('RRMSE vs \theta - Shepp-logan image');
plot(theta, r1);
% Minima at theta = 106

figure;
title('RRMSE vs \theta - Chest CT image');
plot(theta, r2);
% Minima at theta = 54

%% part 2

I_sl_res = part3_2(I_sl, 106);
I_ct_res = part3_2(I_ct, 54);

figure; 
subplot(1, 2, 1), imshow(I_sl_res);
subplot(1, 2, 2), imshow(I_ct_res);



