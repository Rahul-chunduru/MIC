
%% Code for generating pointset data


function M = gen_data(n)

dir_path = '../data/ellipse/data/data/' ; 
images = strcat(dir_path , '*.jpg') ; 

files = dir(images);  % specigy the extension of your image file
for i = n:n + 4
  filename = strcat(dir_path, files(i).name);
  disp(filename) ; 
  imshow(filename);
  % apply processing to the loaded image
  % save the image to an array or back to the folder using 
  [x , y] = getpts  ;
  
  F = [ x(1:16), y(1:16)] ; 
  
  matfile = strcat(dir_path, '/mat/', files(i).name, '.mat'); 
  
  size(F) ; 
  
  save(matfile, 'F' ) ; 
  
end
end