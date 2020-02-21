
%% Returns mean after one iteration 

function [Z1 , newMean] = get_mean(Z, prevMean)

    n = size(Z, 2) ; 
    m = size(Z, 1) ;
    newMean = zeros(m, 1) ; 
   Z1 = zeros(size(Z)) ;
    
    for i = 1:n
        [x, ~] = align( Z(:, i), prevMean) ;
        newMean = newMean + x ;
        Z1(:, i) = x ;
    end
    newMean = newMean / norm(newMean) ; 
  
    
    
end
    % for plotting, polyshape(shapes(1, :, 1), shapes(2, :, 1))