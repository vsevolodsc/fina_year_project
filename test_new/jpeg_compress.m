function [] = jpeg_compress(I,c)
Im = imread(I);
% Im = rgb2gray(I);

imwrite(Im, I, 'Quality', c);