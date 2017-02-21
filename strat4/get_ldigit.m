function msd = get_ldigit(in)
    msd = floor(abs(in) ./ 10.^floor(log10(abs(in))));