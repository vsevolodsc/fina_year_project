function drop = pixel_drop(I1, I2)
h1 = imhist(I1);
h2 = imhist(I2);
drop = 0;
for i=1:256
    for j=1:256
        temp = h1(i)-h2(j);
        if temp > drop
           drop = temp; 
        end
    end
end
