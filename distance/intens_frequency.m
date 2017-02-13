function [out] = intens_frequency(I)
%Calculate vector of relative freq. of intensities of an image
H = imhist(I);
out = zeros(256,1);
s = size(I,1)*size(I,2);

for i = 1:256
    out(i,1) = H(i)/s;
end