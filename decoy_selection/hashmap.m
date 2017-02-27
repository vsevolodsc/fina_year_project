function out = hashmap(forge, N)
% hash map generation where key -> filename
% value -> distance to forge
% n -> number of decoys to be returned
%forge -> attacked image
d = dir('D:/uni-16-17/fyp/images/mirflickr');
n = {d.name};
names = {};
for j = 3:length(n)
   names{j-2} = n{j}; 
end

dir_size = length(names);
distances = zeros(1,dir_size,'uint32');
% forge_img = imread(forge);
str = cellstr(names);

for i=1:dir_size
    ct = strcat('D:/uni-16-17/fyp/images/mirflickr/', str{i});
   decoy_img = imread(ct);
   distance = chi_squared(imhist(forge), imhist(rgb2gray(decoy_img)));
   distances(i) = distance;
end

map = containers.Map(distances, str);
out = nclosest_decoys(map, N);