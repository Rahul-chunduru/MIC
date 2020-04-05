function [X] = gradient_descent_L2(A, I_noisy, b, alp, eps)
    X = I_noisy(:);
    pl = loss(A, X, b, alp);
    c = 0;
    while (c < 50)
        X1 = X - eps*((alp/2)*X + 2*(A')*(A*X - b));
        nl = loss(A ,X1, b, alp);
        if nl < pl
            pl = nl;
            eps = eps*1.1;
            X = X1;
        else
            eps = eps/2;
        end
        c = c + 1;
    end
end
    
