function output = gamma_correction(img_name, gamma)
if gamma < 0
    gamma = 1;
end
I = imread(img_name);
X = double(I);
output_double = 255*(X/255).^gamma;
output = uint8(output_double);
