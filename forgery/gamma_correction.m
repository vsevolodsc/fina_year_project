function output = gamma_correction(I, gamma)
if gamma < 0
    gamma = 1;
end
%R = rgb2gray(I);
X = double(I);
output_double = 255*(X/255).^gamma;
output = uint8(output_double);
