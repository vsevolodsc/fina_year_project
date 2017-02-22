function flag = benf_equiv(A,B)
%Check if 2 vectors are equivalent in Benford's domain
sizeAi = size(A,1);
flag = true; 
for i=1:sizeAi
   if(coset_repr(A(i))~=coset_repr(B(i)))
       flag = false;
   end
end
