function [] = forgery()
A = dir('D:/uni-16-17/fyp/images/original');
    %A - directory of original images
    %Forging images from the original
    %1) Gamma correction - range (random from [0.5;0.8], [1.2;2])
    %2) Histogram stretching
    len = length(A);
    gamma_set = [0.5 0.6 0.7 0.8 1.2 1.3 1.4 1.5 1.6 1.7 1.8 1.9 2.0]; 
    for i=3:len
        img_path = strcat('D:/uni-16-17/fyp/images/original/', A(i).name);
        img = imread(img_path);
        [~,name,ext] = fileparts(A(i).name);
        rand_pos = randi(length(gamma_set));
        gamma = gamma_set(rand_pos);
        gamma_corr_str = strcat('D:/uni-16-17/fyp/images/forgery/',name, '_gamma_',num2str(gamma),ext);
        stretch_str = strcat('D:/uni-16-17/fyp/images/forgery/', name, '_stretch', ext);
        gamma_img = gamma_correction(img, gamma);
        gray_str = rgb2gray(img);
        stretch_img = imadjust(gray_str, stretchlim(gray_str), []);
        imwrite(gamma_img, gamma_corr_str, 'mode', 'lossless');
        imwrite(stretch_img, stretch_str, 'mode', 'lossless');
        gamma_corr_str = '';
        stretch_str = '';
    end
    