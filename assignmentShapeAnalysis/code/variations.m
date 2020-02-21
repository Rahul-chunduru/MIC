
%% returns eigen values and eigen vectors of the covariance matrix.

function [eigenValues, eigenVectors] = variations(Z, mean)

[m, n] = size(Z); 

covarianceMatrix = zeros(m, m) ; 

for i = 1:n
    x1 = Z(:, i) - mean;
    covarianceMatrix = covarianceMatrix + (x1 * x1'); 
end

covarianceMatrix = covarianceMatrix / n  ; 

[V, D] = eig(covarianceMatrix) ; 

[eigenValues, order] = sort(diag(D), 'descend') ; 

eigenVectors = V(:, order) ; 
