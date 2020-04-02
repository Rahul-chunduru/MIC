function [wrange, rrmseV] =  part1c( I, Rt_I, theta)

m = size(Rt_I, 1) ; 

wrange = 1 / m : 1 / m : 1 / 2 ; 
rrmseV = zeros( size(wrange)) ; 

for i = 1 : m / 2 
    R = fbt(Rt_I, theta, @ramlak, wrange(i), 256); 
    rrmseV(i) =  RRMSE( I, R);
end

% plot(wrange, rrmseV); 

end 