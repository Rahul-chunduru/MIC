
%% Aligns the first pointset w.r.t the second pointset

function [z11, z22] = align(z1, z2)

    n = size(z1, 1) ;
    x1 = reshape(z1, [(n / 2), 2]) ;
    x2 = reshape(z2, [(n / 2), 2]) ; 

   
%    c1 = zeros(size(z1)) ;
%    c2 = zeros(size(z2)) ; 
%    c1(1: n/2) = mean(z1(1:(n/2))) ;
%    c1((n/2) + 1:n) = mean(z1((n/2 + 1):n)) ;
%    c2(1: n/2) = mean(z2(1:(n/2))) ;
%    c2((n/2) + 1:n) = mean(z2((n/2) + 1:n)) ;

    x1 = x1 - mean(x1, 1) ; 
    x2 = x2 - mean(x2, 1) ;
    
 %   z1 = z1 - c1;
  %  z2 = z2 - c2;
    
    x1 = x1/norm(x1, 'fro');
    x2 = x2/norm(x2, 'fro');
    
  
   % disp(norm(x1 - x2, 'fro')) ; 
    I1 = eye(2);
    I1(2,2) = -1;
    [U, S, V] = svd(x2'*x1);
    if (det(V*U') > 0)
        R = V*U';
    else
        R = V*I1*U';
    end
    
    x11 = x1*R;
    x22 = x2;
    

    
    %disp(norm(x11 - x22, 'fro')) ;
    
    z11 = reshape(x11, [n , 1]) ; 
    z22 = reshape(x22, [n , 1])  ; 
end