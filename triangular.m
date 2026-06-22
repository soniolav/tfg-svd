function [A,Q] = triangular(A)
m = size(A,1);
n = size(A,2);
Q = eye(m);
for i = 1:n-1
    a = A(i:end,i);
    if sum(abs(a(2:end)))~=0
        H = house_matrix(a);
        A(i:m,i:n) = H * A(i:m,i:n);
        Q(:,i:m) = Q(:,i:m) * H;
    end
end
if m>n % Se hacen ceros por debajo de la diagonal en la última columna
    a = A(n:end,n);
    if sum(abs(a(2:end)))~=0
        H = house_matrix(a);
        A(n:m,n) = H * A(n:m,n:n);
        Q(:,n:m) = Q(:,n:m) * H;
    end
end