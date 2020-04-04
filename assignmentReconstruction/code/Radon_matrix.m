function [R] = Radon_matrix(drho, dtheta, M, N)
    rmax = sqrt(M*M + N*N);
    rhos = (-rmax/2) : drho : (rmax/2);
    thetas = 0 : dtheta : 180 - dtheta;
    
    L = length(rhos);
    T = length(thetas);
    R = false(L*T, M*N);
    
    xmin = ceil(-N/2);
    ymin = ceil(-M/2);
    
    for ii = 1:T
        theta = thetas(ii)*(pi/180);
        
        for jj = 1:L
            rho = rhos(jj);
            
            if (theta >= pi/4 && theta <= 3*(pi/4))
                xinds = -rmax : min(1/sqrt(2), 1/abs(cot(theta))) : rmax;
                yinds = (rho - xinds*cos(theta))/sin(theta);
            else
                yinds = -rmax : min(1/sqrt(2), 1/abs(tan(theta))) : rmax;
                xinds = (rho - yinds * (sin(theta)))./cos(theta);
            end
            
            p = round(xinds - xmin) + 1;
            q = round(yinds - ymin) + 1;
            inds = p >= 1 & p <= N & q >= 1 & q <= M;
            R((ii-1)*L + jj, unique(sub2ind([M N], q(inds), p(inds)))) = 1;
        end
    end
    R = double(sparse(R)) ; 
end
    
    
    