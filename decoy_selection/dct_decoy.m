function out = dct_decoy(forge, N)
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


T_DCT = dctmtx(8);
dct_trans = @(block)(T_DCT*block.data*T_DCT');
F_DCT = blockproc(double(forge), [8 8], dct_trans); %forge in dct domain
%filter DC components
mask = ones(8,8); mask(1,1)=0;
filter_butac = @(block) (block.data*mask);
FF_DCT = blockproc(F_DCT, [8 8], filter_butac); %AC components of the forge

for i=1:dir_size
    ct = strcat('D:/uni-16-17/fyp/images/mirflickr/', str{i});
   decoy_img = imread(ct);
   D = rgb2gray(decoy_img);
   if abs(size(D,1) - size(forge,1)) <=50 ...
           && abs(size(D,2) - size(forge,2)) <=50 
%        abs(size(D,1) - size(forge,1))
%        abs(size(D,2) - size(forge,2))
       D = imresize(D, [size(forge,1) size(forge,2)]);
       DEC_DCT = blockproc(double(D), [8 8], dct_trans);
       FDEC_DCT = blockproc(DEC_DCT, [8 8], filter_butac);
       distance = chi_squared(FF_DCT, FDEC_DCT);
       distances(i) = distance;
   end
end

map = containers.Map(distances, str);%Automatically populates a hashtree
                                     %and sorts it by key
out = nclosest_decoys(map, N);
