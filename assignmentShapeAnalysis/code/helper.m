
%% Plots all the required graphs in question for a given dataset

function [] = helper(shapes)

%% Plot1

[n, m] = size(shapes) ;
figure ; 
title('Input pointsets');
hold on
for i = 1:m
    ob = polyshape(shapes(1:(n/2), i), shapes((n/2) + 1 : n, i)) ;
   plot(shapes(1:(n/2), i), shapes((n/2) + 1:n, i)) ; 
end

X = shapes(1:(n/2), :) ;
Y = shapes((n/2)+1:n, :) ; 
%scatter(X(:), Y(:));
hold off



%% Plot2

previous_mean = shapes(:, 1) ;
diff = norm(shapes(:, 5)) ;
new_mean = zeros(n, 1) ;
% [Z, new_mean] = get_mean(Z, previous_mean) ;
% size(Z)
c = 0 ;
while (diff > power(10, -15))
    c = c + 1 ; 
   [Z, new_mean] = get_mean(shapes, previous_mean) ;
   diff = norm(new_mean - previous_mean); 
   previous_mean = new_mean ;
end
X1 = Z(1:(n/2), :) ;
Y1 = Z((n/2)+1:n, :);
figure; 
title('mean over aligned pointsets'); 
%ob = polyshape(previous_mean(1:(n/2)), previous_mean((n/2)+1:n)) ;
hold on; 
pbaspect([1,1,1]); 
scatter(X1(:),Y1(:));
plot(previous_mean(1:(n/2)), previous_mean((n/2)+1:n), 'r') ; 
%plot(ob) ;
hold off; 


%% plot3

[Eig_values, Eig_vectors] = variations(Z, previous_mean) ;
Eig_values(1:5)
figure; 
plot(Eig_values(1:5)) ;

%% plot4

vec1 = new_mean + 3*sqrt(Eig_values(1))*Eig_vectors(:, 1);
vec2 = new_mean - 3*sqrt(Eig_values(1))*Eig_vectors(:, 1);

figure;
title('First mode of Variation'); 
hold on; 
scatter(X1(:),Y1(:));
plot(new_mean(1:(n/2)), new_mean((n/2) + 1:n), 'r'); 
plot(vec1(1:(n/2)), vec1((n/2)+1:n), 'black');
plot(vec2(1:(n/2)), vec2((n/2)+1:n), 'black');
hold off ;

vec1 = new_mean + 3*sqrt(Eig_values(2))*Eig_vectors(:, 2);
vec2 = new_mean - 3*sqrt(Eig_values(2))*Eig_vectors(:, 2);

figure;
title('Second mode of Variation'); 
hold on; 
scatter(X1(:),Y1(:));
plot(new_mean(1:(n/2)), new_mean((n/2) + 1:n), 'r'); 
plot(vec1(1:(n/2)), vec1((n/2)+1:n), 'black');
plot(vec2(1:(n/2)), vec2((n/2)+1:n), 'black');
hold off ;

vec1 = new_mean + 3*sqrt(Eig_values(3))*Eig_vectors(:, 1);
vec2 = new_mean - 3*sqrt(Eig_values(3))*Eig_vectors(:, 1);

figure;
title('Third mode of Variation'); 
hold on; 
scatter(X1(:),Y1(:));
plot(new_mean(1:(n/2)), new_mean((n/2) + 1:n), 'r'); 
plot(vec1(1:(n/2)), vec1((n/2)+1:n), 'black');
plot(vec2(1:(n/2)), vec2((n/2)+1:n), 'black');
hold off ;


%% plot5

mind1 = inf ; mind2 = inf ; mind3 = inf ;
i1 = 0 ; i2 = 0 ; i3 = 0;
size(Z)
for i = 1:m
    d1 = norm(Z(:, i) - new_mean) ;
    d2 = norm(Z(:, i) - vec1) ;
    d3 = norm(Z(:, i) - vec2) ;
    if d1 < mind1
        mind1 = d1;
        i1 = i ;
    end
    if d2 < mind2
        mind2 = d2 ;
        i2 = i ;
    end
    if d3 < mind3
        mind3 = d3 ;
        i3 = i;
    end 
end

figure;
title('Closest image to mean') ; 

mean_closest = Z(:, i1) ; 
hold on;
plot( mean_closest(1:(n/2)), mean_closest((n/2) + 1:n)) ; 
plot(new_mean(1:(n/2)), new_mean((n/2) + 1:n)); 
hold off; 

figure;
title('Closest image to mean + 3sqrt(lambda1)') ; 

vec1_closest = Z(:, i2) ; 
hold on;
plot( vec1_closest(1:(n/2)), vec1_closest((n/2) + 1:n)) ; 
plot(vec1(1:(n/2)), vec1((n/2) + 1:n)); 
hold off; 

figure;
title('Closest image to mean - 3sqrt(lambda1)') ; 

vec2_closest = Z(:, i3) ; 
hold on;
plot(vec2_closest(1:(n/2)), vec2_closest((n/2) + 1:n)) ; 
plot(vec2(1:(n/2)), vec2((n/2) + 1:n)); 
hold off;