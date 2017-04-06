function [] = benford_runner(I,n)
%Runner function - attacking Benford Law using permutation decoding
%I is the forged grayscale image with its dimension divisible by 8
%n is the neighbourhood size
if mod(size(I,1), 8) ~= 0 || mod(size(I,2), 8) ~= 0
    display('Incorrect dimensions - must be divisible by 8');
    return;
end
dec = dct_decoy(I,n);
select_best_acperm(I,dec);