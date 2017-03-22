function [] = precompute_hist()
set(0,'DefaultFigureVisible','off');
d = dir('D:/uni-16-17/fyp/images/test');
n = {d.name};
length(d)
names = {};
for j = 3:length(n)
   names{j-2} = n{j}; 
end
dir_size = length(names);
str = cellstr(names);

for i=1:dir_size
    ct = strcat('D:/uni-16-17/fyp/images/test/', str{i});
    str_out = strcat('D:/uni-16-17/fyp/images/decoy_histograms/', str{i});
    hfig = figure; imhist(rgb2gray(imread(ct)));
    saveas(rgb2gray(hfig), str_out);
    close all
end
set(0,'DefaultFigureVisible','on');