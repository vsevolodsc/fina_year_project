function out = value_of_ith_bin(bin,I)
%The value of the ith bin of the histogram of I
h= imhist(I);
bin_val1 = h(bin);
bin_val2 = h(bin-1);

sum=0;
for i=1:256
    count =0;
    count2 = 0;
    if(h(i)<bin_val1)
        count = 1;
    end
    if(h(i)>=bin_val2)
        count2=1;
    end
    sum = sum+(count*count2);
end
out = sum/256;