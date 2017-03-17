function out = hist_stretch(I)
out = imadjust(I, stretchlim(I),[]);