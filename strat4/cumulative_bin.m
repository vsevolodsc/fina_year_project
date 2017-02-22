function out = cumulative_bin(bin, I)
h= imhist(I);
bin_val1 = h(bin);

sum=0;
for i=1:256
    count =0;
    if(h(i)<bin_val1)
        count = 1;
    end
    sum = sum+count;
end
out = sum/256;