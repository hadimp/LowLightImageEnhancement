% This piece of code is not wrriten by me.
% Source: https://github.com/estija/LIME/blob/master/maked_alt.m
function [D] = maked_alt(m)

A = zeros(m,m+1);
for i = 1:m
     A(i,i) = -1;
     A(i,i+1) = 1;
end
D = A;

end