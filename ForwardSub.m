function x = ForwardSub(a,b)
% The function solves a system of linear equations ax=b
% where a is lower triangular by using forward substitution. 
n = length(b);
x(1,1) = b(1)/a(1,1);
for i = 2:n 
    x(i,1)=(b(i)-a(i,1:i-1)*x(1:i-1,1))./a(i,i);
end