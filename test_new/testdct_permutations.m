function out = testdct_permutations(I, decoy)
if size(I,1) ~= size(decoy,1) || size(I,2) ~= size(decoy,2)
    decoy_res = imresize(decoy, [size(I,1) size(I,2)]);
end
s1 = size(I,1);
s2 = size(I,2);
mask_ac = ones(8,8); mask_ac(1,1)=0;
mask_dc = zeros(8,8); mask_dc(1,1)=1;

T_DCT = dctmtx(8);
dct_trans = @(block)(T_DCT*block.data*T_DCT');
I_DCT = blockproc(double(I), [8 8], dct_trans);
D_DCT = blockproc(double(decoy_res), [8 8], dct_trans);
I_DCT(1:8,1:8)

mask_ac
filter_dc = @(block) (block.data.*mask_ac); %Replace dc component by 0
FI_DC = blockproc(I_DCT, [8 8], filter_dc);
FD_DC = blockproc(D_DCT, [8 8], filter_dc);
FI_DC(1:8,1:8)

filter_ac = @(block) (block.data.*mask_dc); %Replace AC components by 0
FI_AC = blockproc(I_DCT, [8 8], filter_ac);

vec_FIDC = FI_DC(:);
vec_FDDC = FD_DC(:);

[~,idx] = sort(vec_FIDC, 'ascend');
s_dec = sort(vec_FDDC, 'ascend');
out_vec(idx) = s_dec;

AC_OUT = reshape(out_vec,s1,s2); 

% AC_OUT(1:8,1:8)

ACDC_out = AC_OUT+FI_AC;

dct_inverse = @(block)(T_DCT'*block.data*T_DCT);
out = blockproc(ACDC_out, [8 8], dct_inverse);
out = uint8(out);
