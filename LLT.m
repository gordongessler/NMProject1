function [x] = LLT(A,b)
% The function solves a system of equations LL^Tx=b 
% Input variables: 
% A The tridiagonal and symmetric positive definite matrix. 
% b A column vector of constants. 
% Output variable: 
% A colum vector with the solution.

%Check conditions
%Dimensions
[m,n]=size(A);
[o,p]=size(b);
if(m~=n || p ~=1 || o ~=n)
    disp("Dimensions incorrect.");
    return;
end

%Tridiagonal
test=tril(A,-2) + triu(A,2);
if(~isequal(test, zeros(n,n)))
    disp("A is not tridiagonal.")
    return;
end

%Symmetric
if(~isequal(diag(A,1),diag(A,-1)))
    disp("A is not symmetric.")
    return;
end

%Positive definite
if(prod(diag(A))==0||any(diag(A)<0))
    disp("A is not positive definite.")
    return;
end

%Print condition number of A, as required in appendix
disp("Condition number of A: ")
disp(cond(A))

L = cholesky(A);

disp('Error:');
error_dec=norm(A-L*L')/norm(A);
disp(error_dec);
%Solve equations
y = ForwardSub(L,b);
x = BackwardSub(transpose(L),y);

