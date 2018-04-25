disp('----------------------Example 1----------------------');
A = [3 1 0 0 0;1 3 1 0 0;0 1 3 1 0; 0 0 1 3 1;0 0 0 1 3];
b=transpose([1 1 1 1 1]);
x=LLT(A,b)
A
b

disp('----------------------Example 2----------------------');
A = tridiag1([2 2 2 2 2 2 2 2 2 2],[1 1 1 1 1 1 1 1 1]);
b=transpose([3 4 4 4 4 4 4 4 4 3]);
x=LLT(A,b)
A
b

disp('----------------------Example 3----------------------');
A = tridiag1([5 5 5 5 5 5],[1 2 3 2 1]);
b=transpose([1 3 4 5 2 0]);
A
b
x=LLT(A,b)

disp('----------------------Example 4----------------------');
n=10;
b=zeros(1,n-1);
a=zeros(1,n);
for i=1:n-1
    b(1,i)=randn;
end
a(1,1)=abs(b(1,1))+abs(rand);
a(1,n)=abs(b(1,n-1))+abs(rand);
for i=2:n-1
    a(1,i)=abs(b(1,i-1))+abs(b(1,i))+abs(rand);
end
L=diag(b,-1)+diag(b,1)+diag(a);
x=LLT(L,transpose(1:n))