function [A] =tridiag1(a,b,c)
% [A] =tridiag1(a,b,c)
% A is a tridiagonal matrix with diagonal entries a(1),...,a(n)
% b(1),...,b(n-1) (below a diagonal) and c(1),...,c(n-1) (under a diagonal)

a=a(:); b=b(:); c=c(:);
na=max(size(a));
nb=max(size(b));
nc=max(size(c));
A=zeros(na);

if  nb~=(na-1) || nc~=(na-1)
    disp('Dimensions of a, b and c  are not correct!');
    return;
end

A=diag(a)+ diag(b,-1)+diag(c,1);
end