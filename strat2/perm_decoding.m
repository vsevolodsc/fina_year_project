function out = perm_decoding(I, decoy)

%[~, idx] = sort(I, 'ascend');
%sort_dec = sort(decoy, 'ascend');
%out = sort_dec(idx);

vecI = I(:);
vecDecoy = decoy(:);
[~, ind] = sort(vecI, 'ascend');
sort_vecDec = sort(vecDecoy, 'ascend');
out_vec(ind) = sort_vecDec;
%out = vec2mat(out_vec, size(I,2));
out = reshape(out_vec, size(I,2), size(I,1));
