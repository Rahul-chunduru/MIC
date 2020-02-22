%% computes posterior function and gradient. Ix - current 

function [Ig] = compute_function(Ix, Iy, funcX, funcV, alpha)
    [m,n] = size(Ix);
    Ig = zeros(m,n);
    for i = 1:m
        for j = 1:n
            i1 = Ix(i, j);
            if i > 1            
                i2 = Ix(i-1, j);
            else
                i2 = Ix(m, j); 
            end
            if i < m                 
                i3 = Ix(i+1, j);
            else
                i3 = Ix(1, j) ; 
            end
            if j > 1
                i4 = Ix(i, j-1);
            else
                i4 = Ix(i, n); 
            end
            if j < n
                i5 = Ix(i, j+1);
            else
                i5 = Ix(i, 1); 
            end
            
            fV = funcV(i1 - i2) + funcV(i1 - i3) + funcV(i1 - i4) + funcV(i1 - i5) ;
            Ig(i, j) = alpha * funcX(Ix(i,j) - Iy(i,j)) + (1 - alpha)*fV;
            
        end
    end
end
    