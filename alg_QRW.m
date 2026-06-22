function Ak = alg_QRW(A)
n = size(A,1);
if n>1
    i = 1;
    cond = false;
    while ~cond && i<n % Para ver si hay deflación
        cond = abs(A(i+1,i))<1e-12;
        i = i + 1;
    end
    if cond
        Ak = blkdiag(alg_QRW(A(1:i-1,1:i-1)), alg_QRW(A(i:end,i:end)));
    else % Se calcula con la traslación de Wilkinson
        d = (A(n-1,n-1)-A(n,n))/2;
        if d == 0
            s = 1;
        else
            s = sign(d);
        end
        b = abs(A(n-1,n))^2;
        muk = A(n,n)-s*b/(abs(d)+sqrt(d^2+b));
        [Q_k,R_k] = fact_QR(A-muk*eye(n));
        A = R_k*Q_k + muk*eye(n);
        Ak = alg_QRW(A);
    end
else
    Ak = A;
end