function out = pixel_remapping(I, I2)
% function to remap pixels according to transport. function
%Output = A forged image (I) combined with a decoy (I2)
forge = imread(I);
decoy = imread(I2);

out