function [Ig] = compute_grad(Ix, Iy, sig, bt)
    [m,n] = size(Ix);
    Ig = zeros(m,n);
    for i = 1:m
        for j = 1:n
            i1 = Ix(i, j);
            grad = 0;
            if i > 1            
                i2 = Ix(i-1, j);
                grad = grad + grad_1(i1 - i2) ;
            end
            if i < m                 
                i3 = Ix(i+1, j);
                grad = grad + grad_1(i1 - i3) ;
            end
            if j > 1
                i4 = Ix(i, j-1);
                grad = grad + grad_1(i1 -i4) ;
            end
            if j < n
                i5 = Ix(i, j+1);
                grad = grad + grad_1(i1 - i5) ;
            end
            Ig(i, j) = (((1-bt)*2*(Iy(i,j) - Ix(i, j)))/(sig)) + (bt)*grad;
        end
    end
end
    