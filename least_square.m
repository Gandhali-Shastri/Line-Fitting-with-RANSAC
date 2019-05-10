function [a0,a1]=least_square(x,y)
x=x(:);
y=y(:);
X=[x,ones(numel(x),1)];
a = (X'*X)\(X'*y);
a0=a(2);
a1=a(1);
end