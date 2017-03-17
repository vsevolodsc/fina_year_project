function out = dct_permutations(I, decoy)
if size(I,1) ~= size(decoy,1) || size(I,2) ~= size(decoy,2)
    decoy_res = imresize(decoy, [size(I,1) size(I,2)]);
end
s1 = size(I,1);
s2 = size(I,2);

T_DCT = dctmtx(8);
dct_trans = @(block)(T_DCT*block.data*T_DCT');
I_DCT = blockproc(double(I), [8 8], dct_trans);
D_DCT = blockproc(double(decoy_res), [8 8], dct_trans);

vec_IDCT = I_DCT(:);
vec_DDCT = D_DCT(:);
for i=1:size(vec_IDCT,1)
   ben(i) = get_msd(vec_IDCT(i)); 
end
% hist(ben);

[~,idx] = sort(vec_IDCT, 'ascend');
s_dec = sort(vec_DDCT, 'ascend');
out_vec(idx) = s_dec;
for i=1:size(vec_IDCT,1)
   ben(i) = get_msd(out_vec(i)); 
end
hist(ben);
out_dct = reshape(out_vec, s1,s2);

dct_inverse = @(block)(T_DCT'*block.data*T_DCT);
out = blockproc(double(out_dct), [8 8], dct_inverse);

out = uint8(out);
