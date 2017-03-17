function out = perm_decoding(I, decoy)
if size(I,1) ~= size(decoy,1) || size(I,2) ~= size(decoy,2)
    decoy_res = imresize(decoy, [size(I,1) size(I,2)]);
end
vecI = I(:);
vecDecoy = decoy_res(:);
size(vecI)
size(vecDecoy)
[~, ind] = sort(vecI, 'ascend');
sort_vecDec = sort(vecDecoy, 'ascend');
out_vec(ind) = sort_vecDec;
out = reshape(out_vec, size(I,2), size(I,1));
