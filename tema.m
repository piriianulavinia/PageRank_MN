function [ x ] = PageRank( )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
A = [0 1 0 1;1 0 1 0; 1 1 0 0; 1 1 1 0] 
tol = 0.01;
d = 0.85;
n = size(A,2);
c = sum(A,1); %suma pe coloane a G
k = find(c~=0); %poz i la care c(i) !=0
D = sparse(k,k,1./c(k), n, n); 
e = ones(n,1);
I = speye(n,n);

z = ((1-d)*(c~=0) + (c==0))/n;
M = d*A*D + e*z;
x = e/n;
oldx = zeros(n,1);
while(norm(x - oldx) > tol)
    oldx = x;
    x = (I - M)\e;
end
x = x/sum(x);

end

