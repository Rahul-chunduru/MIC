function freq = ramlak(f, wmax)
 
l = length(f);

freq = zeros(size(f));

for i = 1:l
    if abs(f(i)) < wmax
        freq(i) = abs(f(i));
    end
end

end