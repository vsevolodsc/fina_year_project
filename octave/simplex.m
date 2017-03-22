function out = simplex(J, decoy)
%options = optimset('LargeScale','on','Simplex','on');
h = imhist(decoy);
m = size(J,1)*size(J,2); %image size
q = 256; %size of gray intensities
z = J(:); %image vector
v = 1:q; %255 shades of gray
%Input
f = kron(-v, double(z));
%Eq constraint 1
ones_c1 = ones(q,1); %Input for kron() 
id_c1 = speye(m);
c1 = kron(ones_c1',id_c1);
rhs_c1 = ones(m,1);
%Eq contraint 2
ones_c2 = ones(1,m); 
id_c2 = speye(q);
c2 = kron(id_c2, ones_c2');
rhs_c2 = h;
%Concat constraints
rhs = [rhs_c1; rhs_c2];
constr = [c1;c2'];
%Upper and lower bounds

up = ones(m*256,1);
low = zeros(m*256,1);
%Simplex

out = glpk(f(:),constr,rhs,low,up);
%Kinda works - negative result

endfunction