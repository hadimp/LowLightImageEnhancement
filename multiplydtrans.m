% This piece of code is not wrriten by me.
% Source: https://github.com/estija/LIME/blob/master/multiplydtrans.m

function [delG] = multiplydtrans(G)

[p,n] = size(G);
m = floor(p/2);

g = reshape(G,[p*n,1]);
Gx = reshape(g(1:m*n),[m,n]);
Gy = reshape(g(m*n+1:p*n),[m,n]);

Dyi = maked_alt(m);
Dy = -Dyi; 
Dxi = maked_alt(n);
Dx = Dxi(1:n,1:n);
Dx(1:n,1) = Dx(1:n,1) + Dxi(1:n,n+1); 

altGy = zeros(m+1,n);
altGy(2:m+1,1:n) = Gy;
altGy(1,2:n) = Gy(m,1:n-1);
altGy(1,1) = Gy(m,n);

delGy = Dy * altGy;
delGx = Gx * Dx;
delG = delGx + delGy;

end