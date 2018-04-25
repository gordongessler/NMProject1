function [LC] = cholesky(M)
%The function finds the Cholesky factiorization of an tridiagonal positive
%definite matrix
n = length( M );
D = zeros(n);
LC = zeros(n);
D(1,1)= M(1,1);

for i=2:n
    D(i,i) = M(i,i)-(M(i-1,i))^2/D(i-1,i-1);
end
LC=sqrt(LC+D);
for i=1:n-1
    LC(i+1,i) = M(i+1,i)/sqrt(D(i,i));
end
end

