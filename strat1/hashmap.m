function [map] = hashmap(dir, forge)
% hash map generation where key -> filename
% value -> distance to forge
n = {dir.name};
names = {};
for j = 3:length(n)
   names{j-2} = n{j}; 
end

dir_size = length(names);
distances = zeros(1,dir_size,'uint32');
forge_img = imread(forge);
str = cellstr(names);
for i=1:dir_size
   decoy_img = imread(str{i});
   distance = chi_squared(imhist(forge_img), imhist(decoy_img));
   distances(i) = distance;
end
length(str)
length(distances)
map = containers.Map(distances, str);
