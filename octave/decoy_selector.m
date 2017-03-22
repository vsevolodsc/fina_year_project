function out = decoy_selector(forge, N)
% HashTree population where key is the distance and value is the filename 
% of a decoy
% K-NN algorithm implementation using a chi-squared distance

d = dir('D:/uni-16-17/fyp/images/mirflickr');
n = {d.name};
names = {};
for j = 3:length(n)
   names{j-2} = n{j}; 
end

dir_size = length(names);
distances = zeros(1,dir_size,'uint32'); %key - distances vector
str = cellstr(names); %value - file names

for i=1:dir_size
    ct = strcat('D:/uni-16-17/fyp/images/mirflickr/', str{i});
   decoy_img = imread(ct);
   distance = chi_squared(imhist(forge), imhist(rgb2gray(decoy_img)));
   distances(i) = distance;
end

map = containers.Map(distances, str);%Automatically populates a hashtree
                                     %and sorts it by key
out = nclosest_decoys(map, N);

endfunction