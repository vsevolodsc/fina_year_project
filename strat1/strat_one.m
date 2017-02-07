function [] = strat_one(decoy_list, forge)
%Output image generation
%access decoy_list -> decoy_list{i}
[~, forg_name, ~] = fileparts(forge);
for i=1:length(decoy_list)
    [~, dec_name, ext] = fileparts(decoy_list{i});
    str = strcat('D:/uni-16-17/fyp/images/output/',forg_name, '_', dec_name, ext);
    out = pixel_remapping(forge, decoy_list{i}); 
    imwrite(out, str);
end