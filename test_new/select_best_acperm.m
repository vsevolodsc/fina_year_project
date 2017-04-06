function out = select_best_acperm(I, dec)
%An algorithm which will apply each element of dec (a list of closest decoys)
%on to the forged image, SSIM measure will be used to select a best decoy,
%and produce the output
old = 0;
for i=1:size(dec,2)
    decoy = rgb2gray(imread(dec{i}));
    if size(I,1) ~= size(decoy,1) || size(I,2) ~= size(decoy,2)
    decoy = imresize(decoy, [size(I,1) size(I,2)]);
    end
    pc = dct_permutations(I, decoy);
    psn = psnr(I, pc);
    if old<psn
        old=psn;
        out = pc;
    end
end
figure;
title('Attacking Benford Law forensic detector of JPEG compression');
subplot(2,2,1); imshow(I);
title('Attacked Image (Compressed)');
subplot(2,2,2); imshow(out);
title(['Result Image PSNR= ' num2str(old)]);
subplot(2,2,3); benford_hist(I);
title('Attacked MSD histogram');
subplot(2,2,4); benford_hist(out);
title('Result MSD histogram');
