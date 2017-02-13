function [pixel_min, pixel_max, drop] = pixel_drop(I)
H = imhist(I);
minim = min(H);
maxim = max(H);
drop = maxim - minim;
for i=1:256
    if H(i) == minim
        pixel_min = i;
    end
    if H(i) == maxim
        pixel_max = i;
    end
end
