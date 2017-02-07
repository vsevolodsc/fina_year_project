function out = hashmap(dir, forge, n)
% hash map generation where key -> filename
% value -> distance to forge
% n -> number of decoys to be returned
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

map = containers.Map(distances, str);
out = nclosest_decoys(map, n);