function out = cumul_hist_bin(bin, I)
sum=0;
for i=1:size(I,1)
    for j=1:size(I,2)
       if(I(i,j)<=bin)
           sum = sum+1;
       end
    end
end
out = sum/(size(I,1)*size(I,2));