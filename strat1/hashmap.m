function out = hashmap(dir, forge, N)
% hash map generation where key -> filename
% value -> distance to forge
% n -> number of decoys to be returned
%dir -> directory of decoys
%forge -> attacked image
n = {dir.name};
names = {};
for j = 3:length(n)
   names{j-2} = n{j}; 
end

dir_size = length(names);
distances = zeros(1,dir_size,'uint32');
% forge_img = imread(forge);
str = cellstr(names);

for i=1:dir_size
   decoy_img = imread(str{i});
   distance = chi_squared(imhist(forge), imhist(decoy_img));
   distances(i) = distance;
end

map = containers.Map(distances, str);
out = nclosest_decoys(map, N);