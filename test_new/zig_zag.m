function out = zig_zag(C)
vec = zeros(1,size(C,1)*size(C,2));
zz8 = [1 2 6 7 15 16 28 29;
      3 5 8 14 17 27 30 43;
      4 9 13 18 26 31 42 44;
      10 12 19 25 31 41 45 54;
      11 20 24 33 40 46 53 55;
      21 23 34 39 47 52 56 61;
      22 35 38 48 51 57 60 62;
      36 37 49 50 58 59 63 64;];
for i=1:size(C,1)
    for j=1:size(C,2)
    vec(zz8(i,j)) = C(i,j);
    end
end
out = reshape(vec, size(C,1), []);