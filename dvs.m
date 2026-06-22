function S = dvs(A)
m = size(A,1);
n = size(A,2);
B = bidiag(A);
if m>=n
    B2 = B'*B;
else
    B2 = B*B';
end
Bk = alg_QR(B2);
S = diag(Bk);
S = sort(sqrt(S),'descend');
