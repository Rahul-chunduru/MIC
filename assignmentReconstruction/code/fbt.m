function I_rec = fbt(Rt_I, theta, filter, L)

% into frequency domain

Rt_freq = fftshift(fft(Rt_I));
m = size(Rt_freq, 1) ; 
freq = (-0.5 : 1/m : 0.5 - 1/m);
freq = freq'; 

% apply filter
freqs = filter(freq, L); 
Rt_filt = Rt_freq ; 

for i = 1:length(theta)
    Rt_filt(:, i) = freqs .* Rt_freq(:,i) ; 
end

% reconstruct the image

Rt_filt = real(ifft(ifftshift(Rt_filt)));
I_rec = iradon(Rt_filt, theta, 'linear', 'none');


end