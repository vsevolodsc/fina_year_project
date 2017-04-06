function [] = plot_perm_dec(I,O, ssim)
%Where I is a detectable forgery
%O is the output

figure;
subplot(2,2,1);
imshow(I);
title('Input: Forgery');
subplot(2,2,2);
imshow(O);
title(['Output: SSIM = ' num2str(ssim)]);
subplot(2,2,3);
imhist(I);
title('Input: Histogram')
subplot(2,2,4);
imhist(O);
title('Output: Histogram');

