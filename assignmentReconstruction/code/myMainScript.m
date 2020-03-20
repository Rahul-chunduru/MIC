I = imread('../data/SheppLogan256.png');
Rt_I = radon(I);
theta = 3 * (1:60) - 2;

% select multiples of 3 angles. 
Rt_I = Rt_I(:, theta);

%reconstruct without filters
I_res = iradon(Rt_I, theta);

%show images
imshow(I);
figure; 
imshow(I_res); 