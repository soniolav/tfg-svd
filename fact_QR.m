function [Q,R] = fact_QR(A)
[R,Q] = triangular(A);
m = size(A,1);
n = size(A,2);
d = diag(R);
if ~all(d>=0) % Para obtener la factorización en la que R_ii >= 0
    if isreal(A)
        v = sign(d);   
    else
        v = exp(i*angle(d));
    end
    if m>n
        v(n+1:m) = ones(m-n,1);
    end
    D = diag(v);
    Q = Q*D;
    R = D'*R;
end