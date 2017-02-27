function out = select_best_output(I, dec)
%An algorithm which will apply each element of dec (a list of closest decoys)
%on to the forged image, SSIM measure will be used to select a best decoy,
%and produce the output
old = 0;
for i=1:size(dec)
    pc = perm_decoding(I, rgb2gray(imread(dec{i})));
    mssim = ssim(I, pc);
    if old<mssim
        old=mssim;
        out = pc;
    end
end
