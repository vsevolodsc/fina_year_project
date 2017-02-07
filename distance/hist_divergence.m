function out = hist_divergence(hx, hz)
%where hx is a decoy, hz is curretly achieved image
out =0;
for i=1:255
    out = out + (hz(i) * log(hz(i)/hx(i)));
end