function freq = cosine(f, wmax)
 
l = length(f);

freq = zeros(size(f));

for i = 1:l
    if abs(f(i)) < wmax
        v = 0.5 * pi * f(i) / wmax ; 
        freq(i) = cos(v) * abs(f(i));
    end
end

end