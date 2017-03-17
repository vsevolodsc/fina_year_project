function out = get_msd(x)

out = floor(abs(x)/10^(floor(log10(abs(x)))));