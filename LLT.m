function [x] = LLT(A,b,ex)
% The function solves a system of equations LL^Tx=b 
% Input variables: 
% A The tridiagonal and symmetric positive definite matrix. 
% b A column vector of constants. 
% ex An exact solution. 
% Output variable: 
% A colum vector with the solution.
% If an exact solution is not provided, the result of linsolve(A*A,b)
% will be used instead of it

if (~exist('ex', 'var'))
        ex = linsolve(A*A,b);
end
B=A*A*ex;

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
if(~issymmetric(A))
    disp("A is not symmetric.")
    return;
end

%Positive definite
[~,p] = chol(A);
if(p>0)
    disp("A is not positive definite.")
    return;
end

L = cholesky(A);

%Solve equations
y = L'\b;
z = L*L\y;
x = L'\z;

disp("Condition number of A: ");
disp(cond(A));


disp("Condition number of A^2: ");
disp(cond(A)^2);

disp('Decomposition error:');
error_dec=norm(A-L*L')/norm(A);
disp(error_dec);

disp('Relative error:');
error1=norm(x-ex)/norm(ex);
disp(error1);

disp('Forward stability error:');
error2=error1/cond(A)^2;
disp(error2);

disp('Backward stability error:');
error3=norm(B-A*A*x)/(norm(A*A)*norm(x));
disp(error3);

end

