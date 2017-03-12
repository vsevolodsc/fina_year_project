function out = nclosest_decoys(hash, n)
%reads a hashmap - already sorted by key, where key = distance to forgery
%returns an array on top n filenames according to values
fnames = values(hash);
out = cell(1,n);
for i=1:n
     out{i} = str2mat(fnames(i)); 
end

