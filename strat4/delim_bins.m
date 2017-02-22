function idx = delim_bins(I)
%sort bins in ascending order and return indexes
[~, idx] = sort(imhist(I), 'ascend');