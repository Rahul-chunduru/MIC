%% Q1

%% part (a) 

I = imread('../data/SheppLogan256.png');
theta = 1:3:178;
Rt_I = radon(I, theta);

wmax = 0.5 ; 

I_unfil = iradon(Rt_I, theta); 

I_ramlak1 = fbt(Rt_I, theta, @ramlak, wmax);
I_ramlak2 = fbt(Rt_I, theta, @ramlak, wmax/2);

I_shepplogan1 = fbt(Rt_I, theta, @shepplogan, wmax);
I_shepplogan2 = fbt(Rt_I, theta, @shepplogan, wmax/2);

I_cosine1 = fbt(Rt_I, theta, @cosine, wmax);
I_cosine2 = fbt(Rt_I, theta, @cosine, wmax/2);

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

S0 = I ; 
S1 = imgaussfilt(I, 1) ;
S5 = imgaussfilt(I, 5) ; 

% show the three versions of shepp-logan
figure ; 
subplot( 1 ,3 , 1), imshow(S0) ; 
title('Shepp-logan \sigma = 0') ; 
subplot( 1 ,3 , 2), imshow(S1) ; 
title('Shepp-logan \sigma = 1') ; 
subplot( 1 ,3 , 3), imshow(S5) ; 
title('Shepp-logan \sigma = 5') ;

% computing RRSMSE of Ramlek-filter back projections. 












