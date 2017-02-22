function out = benford_law(I)

out = zeros(size(I,1), size(I,2));
for i=1:size(I,1)
    for j=1:size(I,2)
        out(i,j) = get_ldigit(double(I(i,j)));
    end
end
x = unique(out);
if size(x,1)>9
    x = x(1:9);
end
lsd = [x,histc(out(:),x)];
plot(lsd);