function out = gen_cumul_hist(bins, I)
%out = zeros(size(bins));
for i=1:size(bins,2)
   out(i) = cumul_hist_bin(bins(i),I); 
end