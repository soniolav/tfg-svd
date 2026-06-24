function A = bidiag(A)
m = size(A,1);
n = size(A,2);
p = min(m,n);
for i = 1:p-2
    a1 = A(i:end,i);
    if sum(abs(a1(2:end)))~=0 % Hacemos ceros bajo la diagonal
        v = house_vector(a1);
        v = v/norm(v);
        A(i:m,i:n) = A(i:m,i:n) - 2*v*v'*A(i:m,i:n);
    end
    a2 = A(i,i+1:end)';
    if sum(abs(a2(2:end)))~=0 % Hacemos ceros a la derecha de la superdiagonal
       v = house_vector(a2);
       v = v/norm(v);
       A(i:m,i+1:n) = A(i:m,i+1:n) - 2*A(i:m,i+1:n)*v*v';
    end
end
a1 = A(p-1:end,p-1); % Hacemos ceros bajo la diagonal en la penúltima columna
    if sum(abs(a1(2:end)))~=0
       v = house_vector(a1);
       v = v/norm(v);
       A(p-1:m,p-1:n) = A(p-1:m,p-1:n) - 2*v*v'*A(p-1:m,p-1:n);
    end
if m>n % Hacemos ceros por debajo de la diagonal en la última columna
    a1 = A(p:end,p);
    if sum(abs(a1(2:end)))~=0
        v = house_vector(a1);
        v = v/norm(v);
        A(p:m,p:n) = A(p:m,p:n) - 2*v*v'*A(p:m,p:n);
    end
end
if n>m % Hacemos ceros a la derecha de la subdiagonal en las filas que hagan falta
    for i = p-1:p
        a2 = A(i,i+1:end)';
        if sum(abs(a2(2:end)))~=0
           v = house_vector(a2);
           v = v/norm(v);
           A(i:m,i+1:n) = A(i:m,i+1:n) -2*A(i:m,i+1:n)*v*v';
        end
    end
end
    