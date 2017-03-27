function Anew=imgreader(A)
%reading the image
% A=imread(x);

%get the number of pixels
[rows,columns] = size(A);
disp('No of pixels')
Number_Pixels = rows*columns;

%convert it to grayscale
%AS=rgb2gray(A);
AS=A;

%get the row and col size
rowSize=size(AS,1);
colSize=size(AS,2);

%subtract the bytes from the image
s=int16(AS)-128;
B=[];
Bq=[];
count=1;


blockSize=input('Enter 8 to encode using 8X8 or 16 to use 16X16 : ')
jump=0;
zzcount=0;
if blockSize==8
    jump=7;
    zzcount=64;
    printLimit=8;
else
    jump=15;
    zzcount=256;
    printLimit=16;
end

%encoding process
for i=1:blockSize:rowSize
     for j=1:blockSize:colSize 
        %performing the DCT
        B(i:i+jump,j:j+jump) = dct2(s(i:i+jump,j:j+jump));
        %performing the quantization
        Bq(i:i+jump,j:j+jump)=quantization(B(i:i+jump,j:j+jump),blockSize);
        zigzag(count,1:zzcount)=zzag(Bq(i:i+jump,j:j+jump));
        count=count+1;
     end
end
disp('Original Image')
AS(1:printLimit,1:printLimit)
disp('After level shift')
s(1:printLimit,1:printLimit)
disp('After DCT')
B(1:printLimit,1:printLimit) 
disp('After Quantization')
Bq(1:printLimit,1:printLimit)
zigzag(1,1:zzcount);
%for putting it into a file and compressing
save('compImg.mat','zigzag');
compImage=gzip('compImg.mat')

%for decompressing the file
gunzip('compImg.mat.gz')
%fid = fopen('magic5.bin', 'r');
%Bq=load('compImg.mat')

Bnew=[];
ASnew=[];
%decoding process
for i=1:blockSize:rowSize
     for j=1:blockSize:colSize 
        %performing the dequantization
        Bnew(i:i+jump,j:j+jump)=invQuantization(Bq(i:i+jump,j:j+jump),blockSize);
        %performing the inverse DCT
        ASnew(i:i+jump,j:j+jump) = round(idct2(Bnew(i:i+jump,j:j+jump)));
     end
end
disp('dequantization')
%Bnew(1:printLimit,1:printLimit)
disp('Inverse DCT')
%ASnew(1:printLimit,1:printLimit)
Anew=ASnew+128;
Anew=uint8(Anew);
%rgbImage = cat(3,Anew,Anew,Anew);

subplot(1,2,1)
imshow(A)
title('Original Image')
subplot(1,2,2)
imshow(Anew)
title('Reconstructed Image')
disp('error value')
error=abs(sum(sum(imsubtract(A,Anew).^2)))/Number_Pixels

end



        
