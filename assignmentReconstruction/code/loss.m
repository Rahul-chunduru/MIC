function [l] = loss(A, X, b, alp)
    y = A*X - b;
    l = (y')*y + alp*(X')*X;
end
