function [] = benford_hist(I)

T_DCT = dctmtx(8);
dct_trans = @(block)(T_DCT*block.data*T_DCT');
I_DCT = blockproc(double(I), [8 8], dct_trans);
vec_IDCT = I_DCT(:);
for i=1:size(vec_IDCT,1)
   ben(i) = get_msd(vec_IDCT(i)); 
end
hist(ben)