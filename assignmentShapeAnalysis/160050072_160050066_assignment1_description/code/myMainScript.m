%% Loading shapes
%% Ellipse Dataset
load("../data/ellipse/data/data/ellipse_data.mat");
helper(shapes);

%% Human Hand Dataset
load("../data/hand/data.mat") ;
shapes1 = permute(shapes, [2, 1, 3]);
shapes2 = reshape(shapes1, [112 40]); 
helper(shapes2); 

%% Brain Dataset
load("../data/brain/data/data/brain_data.mat");
shapes1 = permute(shapes, [2, 1, 3]);
shapes2 = reshape(shapes1, [64, 40]); 
helper(shapes2); 

%% Leaf Dataset
load("../data/leaf/data/leaf_data.mat");
shapes1 = permute(shapes, [2, 1, 3]);
shapes2 = reshape(shapes1, [64, 30]); 
helper(shapes2); 




