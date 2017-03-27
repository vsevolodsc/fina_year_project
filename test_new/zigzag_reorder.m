function out = zigzag_reorder(C)
T_DCT = dctmtx(8);
dct_trans = @(block)(T_DCT*block.data*T_DCT');
I_DCT = blockproc(double(C), [8 8], dct_trans);

fun = @(block) zig_zag(block.data);
ZZ = blockproc(I_DCT, [8 8], fun);

dct_inverse = @(block)(T_DCT'*block.data*T_DCT);
out = blockproc(ZZ, [8 8], dct_inverse);
out = uint8(out);

