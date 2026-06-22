function Ak = alg_QR(A)
n = size(A,1);
if n>1
    i = 1;
    cond = false;
    while ~cond && i<n % Para ver si hay deflación
        cond = abs(A(i+1,i))<1e-12;
        i = i+1;
    end
    if cond
        Ak = blkdiag(alg_QR(A(1:i-1,1:i-1)), alg_QR(A(i:end,i:end)));
    else % Se calcula con la traslación de Rayleigh
        muk = A(n,n);
        [Q_k,R_k] = fact_QR(A-muk*eye(n));
        A = R_k*Q_k + muk*eye(n);
        Ak = alg_QR(A);
    end
else
    Ak = A;
end
