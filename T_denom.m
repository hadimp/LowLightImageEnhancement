function [Td] = T_denom(m, n, mu)

dxe = zeros(m,n); 
dye = zeros(m,n); 

dxe(2,2) = -1;
dxe(2,3) = 1;
dx = ((fftshift(fft2(dxe))).'').*(fftshift(fft2(dxe)));

dye(2,2) = -1;
dye(3,2) = 1;
dy = ((fftshift(fft2(dye))).'').*(fftshift(fft2(dye)));

Td = 2 + mu*(dx + dy);

end