function H = house_matrix(a)
n = size(a,1);
I = eye(n);
v = house_vector(a);
H = I-2*(v*v')/(v'*v);