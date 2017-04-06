function out = hist_stretch(I)
out = imadjust(I, stretchlim(I),[]);
figure; 
subplot(2,2,1);
imshow(I);
title('Original');
subplot(2,2,2);
imshow(out);
title('Stretched');
subplot(2,2,3);
imhist(I);
title('Original histogram');
subplot(2,2,4);
imhist(out);
title('Forged histogram');
