function [A] = Back_projection(R)
    [m, n] = size(R);
    Rft = fft(R, m, 1);
    mu_fac = abs((-(m-1)/2) : 1: (m-1)/2);
    size(mu_fac)
    mu_fac = (repmat(mu_fac', 1, n));
    size(mu_fac)
    Rft = Rft;
    R1 = ifft(Rft, m, 1);
    A = iradon(R1, th, 'none');
end
    
    
    