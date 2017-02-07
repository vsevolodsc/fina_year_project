function distance = chi_squared(h1,h2)
distance = 1/2*(sum((h1-h2).^2)/sum(h1+h2));