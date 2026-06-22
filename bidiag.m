function A = bidiag(A)
m = size(A,1);
n = size(A,2);
p = min(m,n);
for i = 1:p-2
    a1 = A(i:end,i);
    if sum(abs(a1(2:end)))~=0 % Hacemos ceros bajo la diagonal
        H = house_matrix(a1);
        A(i:m,i:n) = H * A(i:m,i:n);
    end
    a2 = A(i,i+1:end)';
    if sum(abs(a2(2:end)))~=0 % Hacemos ceros a la derecha de la superdiagonal
       H = house_matrix(a2);
       A(i:m,i+1:n) = A(i:m,i+1:n) * H;
    end
end
a1 = A(p-1:end,p-1); % Hacemos ceros bajo la diagonal en la penúltima columna
    if sum(abs(a1(2:end)))~=0
        H = house_matrix(a1);
        A(p-1:m,p-1:n) = H * A(p-1:m,p-1:n);
    end
if m>n % Hacemos ceros por debajo de la diagonal en la última columna
    a1 = A(p:end,p);
    if sum(abs(a1(2:end)))~=0
        H = house_matrix(a1);
        A(p:m,p:n) = H * A(p:m,p:n);
    end
end
if n>m % Hacemos ceros a la derecha de la subdiagonal en las filas que hagan falta
    for i = p-1:p
        a2 = A(i,i+1:end)';
        if sum(abs(a2(2:end)))~=0
           H = house_matrix(a2);
           A(i:m,i+1:n) = A(i:m,i+1:n) * H;
        end
    end
end
    