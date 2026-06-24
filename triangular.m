function [A,Q] = triangular(A)
m = size(A,1);
n = size(A,2);
Q = eye(m);
for i = 1:n-1
    a = A(i:end,i);
    if sum(abs(a(2:end)))~=0
        v = house_vector(a);
        v = v/norm(v);
        A(i:m,i:n) = A(i:m,i:n) - 2*v*v'*A(i:m,i:n);
        Q(:,i:m) = Q(:,i:m) - 2*Q(:,i:m)*v*v';
    end
end
if m>n % Se hacen ceros por debajo de la diagonal en la última columna
    a = A(n:end,n);
    if sum(abs(a(2:end)))~=0
        v = house_vector(a);
        v = v/norm(v);
        A(n:m,n) = A(n:m,n) - 2*v*v'*A(n:m,n);
        Q(:,n:m) = Q(:,n:m) - 2*Q(:,n:m)*v*v';
    end
end