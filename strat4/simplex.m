function x = simplex(forge, decoy, cons)
%Counterforensics using simplex linear programming algorithm
options = optimoptions('linprog','Algorithm','simplex');
forge = double(forge);
decoy = double(decoy);
forge = forge(:);
lb = ones(size(forge));
ub(1:size(forge)) = 256;
d = imhist(decoy);

% cons = zeros(256, size(forge,1)* size(forge,2));
% for i=1:256
%     temp = filter_vec(forge,i);
%     for j=1:size(forge,1)*size(forge,2)
%         cons(i,j) = temp(j);
%     end
% end

x = linprog(forge,[],[],cons,d',lb,ub,[],options);


