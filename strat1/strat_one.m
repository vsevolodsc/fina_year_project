function [] = strat_one(decoy_list, forge)
%Output image generation
%access decoy_list -> decoy_list{i}
[~, forg_name, ~] = fileparts(forge);
for i=1:length(decoy_list)
    [~, dec_name, ~] = fileparts(decoy_list);
    str = strcat('D:/uni-16-17/fypimages/output/',forg_name, '_', dec_name, '.jpg');
    out = pixel_remapping(forge, decoy_list{i}); 
    imwrite(out, str);
end