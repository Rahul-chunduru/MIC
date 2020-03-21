function freq = shepplogan(f, wmax)
 
l = length(f);

freq = zeros(size(f));

for i = 1:l
    if abs(f(i)) < wmax
        v = 0.5 * pi * f(i) / wmax ; 
        freq(i) = sin(v) * abs(f(i)) / v;
    end
end

end