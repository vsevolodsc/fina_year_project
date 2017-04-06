function [] = benford_hist(I)

T_DCT = dctmtx(8);
dct_trans = @(block)(T_DCT*block.data*T_DCT');
I_DCT = blockproc(double(I), [8 8], dct_trans);
mask_ac = ones(8,8); mask_ac(1,1)=0;
filter_dc = @(block) (block.data.*mask_ac); %Replace dc component by 0
FI_DC = blockproc(I_DCT, [8 8], filter_dc);

vec_IDCT = FI_DC(:);

for i=1:size(vec_IDCT,1)
   ben(i) = get_msd(vec_IDCT(i)); 
end
count = 1:9;
hist(ben, count)