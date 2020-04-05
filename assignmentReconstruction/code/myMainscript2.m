%% Reading image

I = im2double(imread('../data/ChestPhantom.png'));
theta = 0:179 ; 
[M, N] = size(I);

%% CT_imageing (2.1)
drho = 3;
dtheta = 1;
A = Radon_matrix(drho, dtheta, M, N);

%% (2.2)

R = A * I(:);
range = max(R) - min(R) ; 
R_noisy = R + randn(size(R)) * range * 0.02 ; 

%% (2.3)

Rt_I_noisy = reshape(R_noisy, [], 180) ; 

I_noisy = iradon(Rt_I_noisy, theta, 'linear', 'Ram-Lak', 128);

figure ; 
imshow(I_noisy) ; 

%% (2.4)

lambda = 0.1;
I4 = (A'*A + lambda)\A' * R_noisy ; 

%% (2.5)

I_rec = I_noisy ; 
improv = 1 ; 
iter = 0  ;
lambda = 0.5 ; 
step_size = 1 ; 
gamma = 0.05; 

e_curr = objective_func(I_rec, A, R_noisy, lambda, @MRF1, gamma); 

while iter < 200
        
    dI = reshape(2 * A' * ( A * (I_rec(:)) - R_noisy), size(I)) ; 
    dI = dI + lambda * compute_function(I_rec, @gradMRF2, gamma);
    I_next = I_rec - step_size * dI; 
   
    e_next = objective_func(I_next, A, R_noisy, lambda, @MRF2, gamma); 
    
    if e_next < e_curr
        e_curr = e_next ; 
        step_size = step_size / 2 ; 
        I_rec = I_next ; 
    else
        step_size = step_size * 0.1 ; 
    end
    
    iter = iter + 1 ;
   
end

figure; 
imshow(I_rec); 




