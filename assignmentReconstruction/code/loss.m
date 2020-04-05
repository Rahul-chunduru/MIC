function [l] = loss(A, X, b)
    l = norm(A*X - b);
end