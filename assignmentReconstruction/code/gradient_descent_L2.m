function [X] = gradient_descent_L2(A, b, alp, eps, M, s)
    rng(s);
    X = randn(M, 1);
    nl = loss(A, X, b);
    pl = 0;
    c = 0;
    while (pl - nl > 0.0001 || c == 0)
        X = X - eps*((alp/2)*X + 2*(A')*(A*X - b));
        pl = nl;
        nl = loss(A, X, b);
        c = c + 1;
    end
end
    