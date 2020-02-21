function [] = combine_data
    path = "../data/ellipse/data/data/mat/";
    images = strcat(path, "*.mat"); 
    files = dir(images); 
    shapes = zeros([32, numel(files)]) ; 
    for i = 1:numel(files)
        filename = strcat(path, files(i).name);
        load(filename); 
        shapes(1:16, i) = F(:, 1);
        shapes(17:32, i) = F(:,2);
    end
    
    [~, m1] = get_mean(shapes, shapes(:, 1)) ; 
    for i = 1:5 
        [~, m1] = get_mean(shapes, m1) ;
    end
    
    em = reshape(m1, [16 , 2]) ; 
    plot(polyshape(em(:, 1), em(:,2)));
    
    save('../data/ellipse/data/data/data.mat', 'shapes');
end
        